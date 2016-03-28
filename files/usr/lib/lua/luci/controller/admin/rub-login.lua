module("luci.controller.admin.rublogin", package.seeall)

function index()
	entry({"admin", "rublogin"}, cbi("admin/rublogin"), _("RUB Login"), 10)
end
