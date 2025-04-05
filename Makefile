EXTENSION = nanoid
DATA := ${SQL_INSTALL_SCRIPT}

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
