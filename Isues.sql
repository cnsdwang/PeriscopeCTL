-- isues

select
  [sn_issuesums1219]
from
  (
    select
      *
    from
      [general_sigtables_withdemo as b]
      join [general_ccsurvey as survey] on
        survey.conversation_id = b.conversation_id
  )
  as x