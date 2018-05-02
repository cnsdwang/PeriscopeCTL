

--  select ID,Response_ID,Question_ID,value, extension_ID from texter_survey_response_value where response_id= 69

--  select ID, ACTOR_ID,Conversation_ID,Response_ID, Returning_responder, status,Time_submitted,time_imported from texter_survey_response

-- `texter_survey_response.id = texter_survey_response_value.response_id`

-- select * from texter_survey_response_value as v         left join texter_survey_response as r on r.id=v.response_id




;with CTE
as
(
select v.ID, v.Response_ID, v.Question_ID,q.khpquestion , v.value , r.status, r.Time_submitted
  from texter_survey_response_value as v 
        left join texter_survey_response as r on r.id=v.response_id
        left join [squestions as q] on v.Question_ID = q.qid
)
select response_id  as [ID]
, MIN (Time_submitted) AS ["Survey Date"]
, MAX ( CASE WHEN Question_ID = 64  THEN value END) as ["Q1. Did you find this conversation helpful"]   -- Q_1
, MAX ( CASE WHEN Question_ID = 65  THEN value END) as ["Q1_Nest. How helpful was it?"]   -- Q_1_nest
, MAX ( CASE when Question_ID = 69  then value END) as ["How old are you"]   -- Q_iii


-- Q_iv
, MAX ( case when Question_ID = 73  then value END) as ["Gender.Do you consider yourself to be"]  -- Q_iv
, MAX ( CASE WHEN Question_ID = 73
			and value != 'Prefer not to answer'
			and value != 'Agender'
			and value != 'Female'
			and value != 'Genderqueer'
			and value != 'Male'
			and value != 'Trans female'
			and value != 'Trans male'
			and value != 'Other - Write In'
		THEN value END
) as ["Gender.Do you consider yourself to be - Other - Write In"]


-- Q_v
, MAX ( case when Question_ID = 74  then value END) as ["Sexual orientation. Do you consider yourself to be"]    -- Q_v
, MAX ( CASE WHEN Question_ID = 74
			and value != 'Prefer not to answer'
			and value != 'Asexual'
			and value != 'Bisexual or Pansexual'
			and value != 'Gay or Lesbian'
			and value != 'Heterosexual or Straight'
			and value != 'Questioning or Unsure'
			and value != 'Other - Write In'
		THEN value END
) as ["Sexual orientation. Do you consider yourself to be - Other - Write In"]




-- Q_vi
, MAX ( case when Question_ID = 75 and value = 'Canadian' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Canadian"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'British' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - British"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'French' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - French"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'Quebeqois' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Quebeqois"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'First Nations, Métis, or Inuk' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - First Nations, Métis, or Inuk"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'White, European, or Caucasian' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - White, European, or Caucasian"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'South Asian (e.g., East Indian, Pakistani, Sri Lankan)' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - South Asian (e.g., East Indian, Pakistani, Sri Lankan)"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'Asian (e.g., Korean, Chinese, Japanese)' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Asian (e.g., Korean, Chinese, Japanese)"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'African' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - African"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'Caribbean' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Caribbean"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'South East Asian (e.g., Cambodian, Indonesian, Laotian, Vietnamese)' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - South East Asian (e.g., Cambodian, Indonesian, Laotian, Vietnamese)"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'West Asian to Middle Eastern (e.g., Armenian, Egyptian, Iranian, Lebanese)' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - West Asian to Middle Eastern (e.g., Armenian, Egyptian, Iranian, Lebanese)"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'Latin American (e.g., Mexican, South American, Central American)' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Latin American (e.g., Mexican, South American, Central American)"]  -- Q_vi
, MAX ( case when Question_ID = 75 and value = 'Don''t know' then value END) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Don''t know"]  -- Q_vi
, MAX ( CASE WHEN Question_ID = 75
		 and value != 'Canadian'    
		 and value != 'British'    
		 and value != 'French'    
		 and value != 'Quebeqois'   
		 and value != 'First Nations, Métis, or Inuk'   
		 and value != 'White, European, or Caucasian'   
		 and value != 'South Asian (e.g., East Indian, Pakistani, Sri Lankan)'    
		 and value != 'Asian (e.g., Korean, Chinese, Japanese)'    
		 and value != 'African'  
		 and value != 'Caribbean'   
		 and value != 'South East Asian (e.g., Cambodian, Indonesian, Laotian, Vietnamese)'    
		 and value != 'West Asian to Middle Eastern (e.g., Armenian, Egyptian, Iranian, Lebanese)'    
		 and value != 'Latin American (e.g., Mexican, South American, Central American)'    
		 and value != 'Don''t know'     
		 and value != 'Other - Write In'
		THEN value END
) as ["To which ethnic or cultural group(s) do you see yourself as belonging - Other - Write In"]

-- Q_vii
, MAX ( case when Question_ID = 210 and value = 'Canadian Culture' then value END) as ["I identify as part of these groups - Canadian Culture"]
, MAX ( case when Question_ID = 210 and value = 'Indigenous - Within Canada' then value END) as ["I identify as part of these groups - Indigenous - Within Canada"]
, MAX ( case when Question_ID = 210 and value = 'Indigenous - Outside Canada' then value END) as ["I identify as part of these groups - Indigenous - Outside Canada"]
, MAX ( case when Question_ID = 210 and value = 'Immigrant/Newcomer/Permanent Resident' then value END) as ["I identify as part of these groups - Immigrant/Newcomer/Permanent Resident"]
, MAX ( case when Question_ID = 210 and value = 'Refugee/Stateless/No Status' then value END) as ["I identify as part of these groups - Refugee/Stateless/No Status"]
, MAX ( case when Question_ID = 210 and value = 'Visible Minority' then value END) as ["I identify as part of these groups - Visible Minority"]
, MAX ( case when Question_ID = 210 and value = 'Member of a Religious or Spiritual Community' then value END) as ["I identify as part of these groups - Member of a Religious or Spiritual Community"]
, MAX ( case when Question_ID = 210 and value = 'Differently Abled (Physical/Developmental/Learning Disability' then value END) as ["I identify as part of these groups - Differently Abled (Physical/Developmental/Learning Disability"]
, MAX ( case when Question_ID = 210 and value = 'Deaf or Hard of Hearing' then value END) as ["I identify as part of these groups - Deaf or Hard of Hearing"]
, MAX ( case when Question_ID = 210 and value = 'Prefer not to answer OR none of the above' then value END) as ["I identify as part of these groups - Prefer not to answer OR none of the above"]
, MAX ( case when Question_ID = 210
			 and value != 'Canadian Culture'     
			 and value != 'Indigenous - Within Canada'   	
			 and value != 'Indigenous - Outside Canada'  
			 and value != 'Immigrant/Newcomer/Permanent Resident' 
			 and value != 'Refugee/Stateless/No Status'  
			 and value != 'Visible Minority'   
			 and value != 'Member of a Religious or Spiritual Community'  
			 and value != 'Differently Abled (Physical/Developmental/Learning Disability'   
			 and value != 'Deaf or Hard of Hearing'    
			 and value != 'Prefer not to answer OR none of the above'     
			 and value != 'Other - Write In'     
		THEN value END
	) as ["I identify as part of these groups - Other - Write In"]


-- Q3
, MAX ( case when Question_ID = 144 and value = 'From a family member or friend' then value END) as ["How did you learn about us - From a family member or friend"]
, MAX ( case when Question_ID = 144 and value = 'Media or social media' then value END) as ["How did you learn about us - Media or social media"]
, MAX ( CASE WHEN Question_ID = 144
		    and  value != 'From a family member or friend'
		    and  value != 'Media or social media'
			and  value != 'Google search - Write In'
			and  value != 'At school - Write In'
			and  value != 'From a medical or mental health professional - Write In'
			and  value != 'Other - Write In'
		THEN value END
) as ["How did you learn about us - Write In"]


-- Q4
, MAX ( case when Question_ID = 211 and value = 'Less Alone' then value END) as ["Q4. Which of these did you feel as a result of your conversation - Less Alone"]
, MAX ( case when Question_ID = 211 and value = 'Less Distressed' then value END) as ["Q4. Which of these did you feel as a result of your conversation - Less Distressed"]
, MAX ( case when Question_ID = 211 and value = 'Less Upset' then value END) as ["Q4. Which of these did you feel as a result of your conversation - Less Upset"]
, MAX ( case when Question_ID = 211 and value = 'More Hopeful' then value END) as ["Q4. Which of these did you feel as a result of your conversation - More Hopeful"]
, MAX ( case when Question_ID = 211 and value = 'More Confident' then value END) as ["Q4. Which of these did you feel as a result of your conversation - More Confident"]
, MAX ( case when Question_ID = 211 and value = 'More In-Control' then value END) as ["Q4. Which of these did you feel as a result of your conversation - More In-Control"]
, MAX ( case when Question_ID = 211 and value = 'None of the above' then value END) as ["Q4. Which of these did you feel as a result of your conversation - None of the above"]
,MAX ( CASE  WHEN Question_ID = 211
			 and value != 'Less Alone'    
			 and value != 'Less Distressed'    
			 and value != 'Less Upset'   
			 and value != 'More Hopeful'    		
			 and value != 'More Confident'    
			 and value != 'More In-Control'    
			 and value != 'None of the above'    
			 and value != 'Other - Write In'
     	THEN value END  
 ) as ["Q4. Other - Write In"]

, MAX ( case when Question_ID = 213  then value END) as ["Q5. The responder gave me new ways of looking at what I texted about"]   -- Q5
, MAX ( case when Question_ID = 214  then value END) as ["Q6. Did you mention an experience or feelings that you have not shared with anyone else"]   -- Q6
, MAX ( case when Question_ID = 215  then value END) as ["Q7. After your conversation today, how stressed are you right now"]   -- Q7
, MAX ( case when Question_ID = 216  then value END) as ["Q8. How stressed were you feeling about this concern or situation at the beginning of your conversation?"]   -- Q8

, MAX ( case when Question_ID = 217  then value END) as ["Q9. How confident are you that you can now cope with your situation"]
, MAX ( case when Question_ID = 218  then value END) as ["Q10. How likely are you to recommend this service to a friend or someone with the issue you texted in about"]
, MAX ( case when Question_ID = 219  then value END) as ["Q11. I was satisfied with the service I received today"]
, MAX ( case when Question_ID = 220  then value END) as ["Q12. The service was easy to use"]


, MAX ( case when Question_ID = 221 and value = 'Called a helpline, such as Kids Help Phone'  then value END) as ["Q13. If I could not have texted, I would have:Called a helpline, such as Kids Help Phone"]
, MAX ( case when Question_ID = 221 and value = 'Gone to a healthcare provider'  then value END) as ["Q13. If I could not have texted, I would have:Gone to a healthcare provider"]
, MAX ( case when Question_ID = 221 and value = 'Gone to the emergency room'  then value END) as ["Q13. If I could not have texted, I would have:Gone to the emergency room"]
, MAX ( case when Question_ID = 221 and value = 'Searched online for services or information to help me'  then value END) as ["Q13. If I could not have texted, I would have:Searched online for services or information to help me"]
, MAX ( case when Question_ID = 221 and value = 'Managed the issue on my own'  then value END) as ["Q13. If I could not have texted, I would have:Managed the issue on my own"]
, MAX ( case when Question_ID = 221 and value = 'Spoken to a friend'  then value END) as ["Q13. If I could not have texted, I would have:Spoken to a friend"]
, MAX ( case when Question_ID = 221 and value = 'Spoken to a family member'  then value END) as ["Q13. If I could not have texted, I would have:Spoken to a family member"]
, MAX ( case when Question_ID = 221 and value = 'Not spoken to anyone'  then value END) as ["Q13. If I could not have texted, I would have:Not spoken to anyone"]
, MAX ( case when Question_ID = 221 and value = 'Ignored the issue and hoped it got better or went away'  then value END) as ["Q13. If I could not have texted, I would have:Ignored the issue and hoped it got better or went away"]
,MAX(case when Question_ID = 221
			 and value != 'Called a helpline, such as Kids Help Phone' 
			 and value != 'Gone to a healthcare provider'    
			 and value != 'Gone to the emergency room'   
			 and value != 'Searched online for services or information to help me'   
			 and value != 'Managed the issue on my own'   
			 and value != 'Spoken to a friend'   
			 and value != 'Spoken to a family member'   
			 and value != 'Not spoken to anyone'   
			 and value != 'Ignored the issue and hoped it got better or went away'   
			 and value != 'Other - Write In'   
     THEN value END   
) as ["Q13. Other - Write In"]


from CTE 
where time_submitted >= '2018-02-15' and Time_submitted < '2018-05-01'

group by Response_ID
order by Response_ID
