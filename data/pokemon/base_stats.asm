BaseStats::
	table_width BASE_DATA_SIZE
INCLUDE "obj/data/base_stats.asm"
	assert_table_length NUM_POKEMON - 1 ; discount Mew
