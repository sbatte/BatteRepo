
    create table ratings (
        id int4 not null,
        enable boolean not null,
        knowledge varchar(255),
        message varchar(255),
        overall varchar(255),
        service varchar(255),
        title varchar(255),
        email_id int4,
        lawyername_id int4,
        primary key (id)
    );

    create table users (
        user_type varchar(31) not null,
        id int4 not null,
        address varchar(255),
        city varchar(255),
        email varchar(255),
        enable boolean,
        firstname varchar(255),
        lastname varchar(255),
        password varchar(255),
        state varchar(255),
        zip varchar(255),
        expertize varchar(255),
        image bytea,
        year varchar(255),
        primary key (id)
    );

    alter table ratings 
        add constraint FK_039a14991ead441bb06e58e3ee2 
        foreign key (email_id) 
        references users;

    alter table ratings 
        add constraint FK_7de54be2e84943c8baacc630b9d 
        foreign key (lawyername_id) 
        references users;

    create sequence hibernate_sequence;
