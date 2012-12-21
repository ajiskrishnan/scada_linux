ser = require("luars232")

print("hallo iplon")
local err,p = ser.open("/dev/ttyS0")
if(err~=ser.RS232_ERR_NOERROR) then
	print("port open error")
end
print("package working properly")
print("set the baud rate")
print(ser.RS232_BAUD_38400)
err =p:set_baud_rate(ser.RS232_BAUD_38400)
if(err~=ser.RS232_ERR_NOERROR) then
        print("port open error")
end
err = p:set_data_bits(ser.RS232_DATA_8)
if(err~=ser.RS232_ERR_NOERROR) then
        print("port open error")
end
err = p:set_parity(ser.RS232_PARITY_NONE)
if(err~=ser.RS232_ERR_NOERROR) then
        print("port open error")
end
err = p:set_stop_bits(ser.RS232_STOP_1)
if(err~=ser.RS232_ERR_NOERROR) then
        print("port open error")
end
err = p:set_flow_control(ser.RS232_FLOW_OFF)
if(err~=ser.RS232_ERR_NOERROR) then
        print("port open error")
end
print(p)
print("write data")
local i=1
--while i do
err,length = p:write("hello iplon");
if(err~=ser.RS232_ERR_NOERROR) then
        print("write error")
--end
print("write successfully")
end
