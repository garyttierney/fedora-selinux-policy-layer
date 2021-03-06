.PHONY: load unload


USRBINDIR ?= /usr/bin
USRSBINDIR ?= /usr/sbin
SEMODULE = $(USRSBINDIR)/semodule

SOURCES = src/auth.cil \
		  src/capabilities.cil \
		  src/class_mappings.cil \
		  src/class_permissions.cil \
		  src/domain.cil \
		  src/files.cil \
		  src/fstree.cil \
		  src/initd.cil \
		  src/network.cil \
		  src/system_service.cil

CONTRIB_SOURCES = src/contrib/ircd.cil

ALL_SOURCES=$(SOURCES)
ALL_SOURCES+=$(CONTRIB_SOURCES)

load: $(SOURCES)
	$(SEMODULE) --priority=100 -i $(SOURCES)

load-contrib: load $(CONTRIB_SOURCES)
	$(SEMODULE) --priority=100 -i $(CONTRIB_SOURCES)

unload: $(SOURCES)
	$(SEMODULE) --priority=100  $(addprefix -r,$(notdir $(basename $(ALL_SOURCES))))
