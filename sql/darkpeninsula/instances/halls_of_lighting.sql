-- fix mechanic immune Volkhan
update creature_template set mechanic_immune_mask=mechanic_immune_mask|4|8|16|64|128|256|512|1024|4096|65536|131072|524288|67108864|536870912 where entry in  (28587,31536);