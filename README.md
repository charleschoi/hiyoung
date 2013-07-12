하이영하이영 영어롸이팅 프로젝트
-----

1. 문제를 업로드
2. 에세이 쓰기
3. 문장별로 나누기
4. 문장별 코멘트 달기 + 최종 코멘트
5. 단어 뽑아 내기

-----
Model

1. user

	- provider
	- uid
	- name
	- oauth_token
	- oauth_expires_at:datetime
	
2. topic

	- user_id:integer
	- username
	- content:text
	- count:integer

3. essay

	- user_id:integer
	- topic_id:integer
	- username
	- summary:text
	- content:text
	
4. stence

	- user_id:integer
	- essay_id:integer
	- content:text
	
5. comment

	- user_id:integer
	- setence_id:integer
	- username
	- content:text
	
6. check

	- topic_id:integer
	- essay_id:integer
	- comment_id:integer
	- user_id:integer
	- viewed:boolean
	
	
-----
Controller

1. study

	- index : recent topic and essay, form of new topic, write button on each topic, comment button on each essay
	- topic : topics list and each essay list
	- topic_process : for new topic
	- essay : essays list (truncated)
	- write : show topic and write form
	- write_process : for new essay
	- read : topic and essay, essay list in topic
	- comment : topic and essay setences + comment form
	- comment_process : for new comment
	