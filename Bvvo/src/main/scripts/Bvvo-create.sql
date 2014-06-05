
Create sequence hibernate_sequence;


CREATE TABLE users
(
  user_type character varying(31) NOT NULL,
  id integer NOT NULL,
  email character varying(255),
  password character varying(255),
  firstname character varying(255),
  lastname character varying(255),
  address character varying(255),
  city character varying(255),
  state character varying(255),
  zip character varying(255),
  expertize character varying(255),
  year character varying(255),
  image bytea,
  enable boolean NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (id)
);





CREATE TABLE ratings
(
id integer NOT NULL,
title character varying(255),
message character varying(255),
service character varying(255),
knowledge character varying(255),
overall character varying(255),
email_id integer,
lawyername_id integer,
enable boolean NOT NULL,
tsv tsvector,
CONSTRAINT reviews_pkey PRIMARY KEY (id),
CONSTRAINT reviews_lawyername_id_fkey FOREIGN KEY (lawyername_id)
REFERENCES users (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT reviews_uname_id_fkey FOREIGN KEY (email_id)
REFERENCES users (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION
);

create index tsindex on ratings using gin(tsv);


create or replace function messages_ts_trigger_function() returns trigger as $$
begin 
	new.tsv := to_tsvector('english', new.message) || to_tsvector('english', new.title);
	return new;
end 
$$ language plpgsql;

create trigger messages_ts_trigger
	before insert or update 
	on ratings for each row 
	execute procedure messages_ts_trigger_function();

