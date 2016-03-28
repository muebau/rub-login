include $(TOPDIR)/rules.mk

PKG_NAME:=gluon-luci-rub-login
PKG_VERSION:=1
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(GLUONDIR)/include/package.mk

PKG_CONFIG_DEPENDS += $(GLUON_I18N_CONFIG)

define Package/gluon-luci-rub-login
  SECTION:=gluon
  CATEGORY:=Gluon
  DEPENDS:=+gluon-luci-admin
  TITLE:=UI for activating a RUB (Ruhr University Bochum) login feature
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
	$(call GluonBuildI18N,gluon-luci-rub-login,i18n)
endef

define Package/gluon-luci-rub-login/install
	$(CP) ./files/* $(1)/
	$(call GluonInstallI18N,gluon-luci-rub-login,$(1))
endef

$(eval $(call BuildPackage,gluon-luci-rub-login))
