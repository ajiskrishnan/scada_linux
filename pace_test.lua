rs232 = require("luars232")
err = nil
-- Linux
port_name = "/dev/ttyS0"

-- Windows
--port_name = "COM2"

local out = io.stderr

-- open port
local e, p = rs232.open(port_name)
--print(p)
if e ~= rs232.RS232_ERR_NOERROR then
	-- handle error
		out:write(string.format("can't open serial port '%s', error: '%s'\n",
					port_name, rs232.error_tostring(e)))
						return
						end

						-- set port settings
						assert(p:set_baud_rate(rs232.RS232_BAUD_38400) == rs232.RS232_ERR_NOERROR)
						assert(p:set_data_bits(rs232.RS232_DATA_8) == rs232.RS232_ERR_NOERROR)
						assert(p:set_parity(rs232.RS232_PARITY_NONE) == rs232.RS232_ERR_NOERROR)
						assert(p:set_stop_bits(rs232.RS232_STOP_1) == rs232.RS232_ERR_NOERROR)
						assert(p:set_flow_control(rs232.RS232_FLOW_OFF)  == rs232.RS232_ERR_NOERROR)

						out:write(string.format("OK, port open with values '%s'\n", tostring(p)))
						file = io.open("database","w")
						-- read with timeout
						local read_len = 64 -- read one byte
						local timeout = 0 -- in miliseconds
						i = 1
						file = io.open("parameter.txt","a+")
						function test_EOL()
						repeat
						err, data_read, size = p:read(1, 0)
						assert(e == rs232.RS232_ERR_NOERROR)
						--print(data_read)
						until data_read ~= "\n"
						return 1
						end
						--while 1 do
						test_EOL()
						if p:read(1,0) ~= "\r" then
							test_EOL()
							end

							err, data_read, size = p:read(read_len, 0)
							assert(e == rs232.RS232_ERR_NOERROR)
							index = {2,2,4,4,4,4,4,4,4,4,4,4,4,8,2,1,1,1,2,1,0}
							parameter = {}
							x = 1
							y = index[1]
							print("the printing data is ")
							--print(data_read)

							data_read = "12345678910112234444444555555666667778889999882837283798273892738927398278937872947338729743984723984732984723987239847239847239874923"
							for i=1,20,1 do

								parameter[i] = string.sub(data_read,x,y)
									print(parameter[i])
										x = y+1
											y = y + index[i+1]
												file:write(parameter[i])
													file:write("\n")
													end
													--end
													file:close()
													-- close
													assert(p:close() == rs232.RS232_ERR_NOERROR)


