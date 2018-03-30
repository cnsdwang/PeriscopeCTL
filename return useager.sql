-- return useger
select
  [b.startTime:est:date]
  , 1.0 * sum(first_convo) / count(*)
from
  [general_mapreturning as map]
  join [general_sigtables as b] on
    map.conversation_id = b.conversation_id
group by
  1