local f, s, o, ssid
local uci = luci.model.uci.cursor()
local config = 'rub-login'

-- where to read the configuration from

f = SimpleForm("rublogin", translate("RUB Login"))
f.template = "admin/expertmode"

s = f:section(SimpleSection, nil, translate(
                'If your Internet connection is provided by the Ruhr University of Bochum (RUB) '
                  .. 'a login is needed. If this option is enabled the Internet connection will be checked regularly. '
                  .. 'If there is no connection the login website is called with the credentials.'
))

o = s:option(Flag, "enabled", translate("Enabled"))
o.default = uci:get_bool(config, "account", "enabled") and o.enabled or o.disabled
o.rmempty = false

o = s:option(Value, "rubid", translate("RUB ID"))
o:depends("enabled", '1')
o.default = uci:get_first(config, "account", "rubid")

o = s:option(Value, "password", translate("Password"))
o:depends("enabled", '1')
o.default = uci:get_first(config, "account", "password")

function f.handle(self, state, data)
  if state == FORM_VALID then

    if data.enabled == '1' then
      uci:set(config, "account", "enabled", 1)
    else
      uci:set(config, "account", "enabled", 0)
    end

    uci:set(config, "account", "rubid", data.rubid)
    uci:set(config, "account", "password", data.password)

    uci:save(config)
    uci:commit(config)
  end
end

return f
