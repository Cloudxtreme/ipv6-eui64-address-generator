-- To generate addresses:
-- lua eui64_address_generator.lua Sony,Xerox vendors.csv fe80:0000:0000:0000
-- To generate Nmap commands:
-- lua eui64_address_generator.lua Sony,Xerox vendors.csv fe80:0000:0000:0000 true

-- CSV line parser found at: http://lua-users.org/wiki/LuaCsv
function ParseCSVLine (line,sep) 
	local res = {}
	local pos = 1
	sep = sep or ','
	while true do 
		local c = string.sub(line,pos,pos)
		if (c == "") then break end
		if (c == '"') then
			local txt = ""
			repeat
				local startp,endp = string.find(line,'^%b""',pos)
				txt = txt..string.sub(line,startp+1,endp-1)
				pos = endp + 1
				c = string.sub(line,pos,pos) 
				if (c == '"') then txt = txt..'"' end 
			until (c ~= '"')
			table.insert(res,txt)
			assert(c == sep or c == "")
			pos = pos + 1
		else	
			local startp,endp = string.find(line,sep,pos)
			if (startp) then 
				table.insert(res,string.sub(line,pos,startp-1))
				pos = endp + 1
			else
				table.insert(res,string.sub(line,pos))
				break
			end 
		end
	end
	return res
end

--- Given a file containing vendors and their OUIs, extract the chosen vendors.
-- @param chosen_vendors      Comma-separated string of the vendors' names
-- @param vendors_filename    Filename where the vendors are stored
local function load_chosen_vendors_from_file(chosen_vendors, vendors_filename)
  local vendors_table = {}
  
  local cols = ParseCSVLine(chosen_vendors, ",")
  for i, vendor in ipairs(cols) do
    vendors_table[vendor] = {}
  end

  local line_counter = 0
  for line in io.lines(vendors_filename) do
    line_counter = line_counter + 1
    if line_counter > 3 then
      local cols = ParseCSVLine(line, ",")
      if vendors_table[cols[2]] ~= nil then
        local vendor_array = vendors_table[cols[2]]
        vendor_array[#vendor_array + 1] = cols[1]
      end
    end
  end
  return vendors_table
end

--- Change the format of a OUI so it can be "plugged" into an IPv6 address.
-- @param oui    Manufacturer OUI in the format of XX:XX:XX
-- @return       Manufacturer OUI in the format of :XXXX:XX
local function get_formatted_oui(oui)
  return ":" .. string.sub(oui, 1, 2) .. string.sub(oui, 4, 5) .. ":" .. string.sub(oui, 7, 8)
end

--- Generates the IPv6 addresses.
-- @param network_address    IPv6 network address
-- @param formatted_oui      Manufacturer OUI in the format of :XXXX:XX
local function compute_candidate_addresses(network_address, formatted_oui)
  -- The segment numbers are stored in an array for easy access.
  -- A segment is a 4-bit part of an IPv6 address. The array is needed to
  -- process whenever a segment must change words.
  local segment_counter = 6
  local segment_numbers_arr = {1,2,3,4,5,6}

  local words_table = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
  local word_change_triggers = {}
  local word_current_count = {}
  local total_candidate_addresses = math.pow(#words_table, #segment_numbers_arr);

  -- A word-change trigger tells the generator when to change the word it's using.
  for i = 0, #words_table do
    word_change_triggers[i] = math.pow(#words_table, i)
  end
  
  -- Generate all candidate addresses.
  for i = 0, total_candidate_addresses - 1 do
    local generated_arr = {}
    for j = 0, #segment_numbers_arr - 1 do
      if i % word_change_triggers[j] == 0 then
        if word_current_count[j] == nil then
          word_current_count[j] = 0
        end
        word_current_count[j] = word_current_count[j] + 1
      end
      generated_arr[segment_numbers_arr[j + 1]] = words_table[(word_current_count[j] % #words_table + 1)]
    end

    local generated = table.concat(generated_arr, "")
    local formatted_generated = string.sub(generated, 1, 2) .. ":" .. string.sub(generated, 3, 7)
    print(network_address .. formatted_oui .. "FF:FE" .. formatted_generated)
  end
end

local function main(vendors_str, vendors_filename, network_address)
  chosen_ouis = load_chosen_vendors_from_file(vendors_str, vendors_filename)
  for vendor_name in pairs(chosen_ouis) do
    print("# " .. vendor_name)
    for _, oui in ipairs(chosen_ouis[vendor_name]) do
      local formatted_oui = get_formatted_oui(oui)
      if (nmap_commands ~= nil) then
        print("nmap -6 " .. network_address .. formatted_oui .. "FF:FE::/104")
      else
        compute_candidate_addresses(network_address, formatted_oui)
      end
    end
  end
end

vendors_str       = arg[1] or false -- "Xerox,Ericsson,Sony,Ibm,Google"
vendors_filename  = arg[2] or false -- "vendors.csv"
network_address   = arg[3] or false -- "fe80:0000:0000:0000"
nmap_commands     = arg[4]          -- Can be anything.

if (not vendors_str or not vendors_filename or not network_address) then
  print("Wrong parameters. Usage:")
  print("$ lua " .. arg[0] .. " <manufacturers>, <file with OUIS>, <net addr>, <true if only Nmap commands should be generated>")
  print("Example:")
  print("$ lua " .. arg[0] .. " Xerox,Sony vendors.csv fe80:0000:0000:0000 true")
else
  main(vendors_str, vendors_filename, network_address, nmap_commands)
end
