-- CREATE SCHEMA geostore 
CREATE USER geostore LOGIN PASSWORD 'geostore1234f' NOINHERIT;

CREATE SCHEMA IF NOT EXISTS geostore AUTHORIZATION geostore;

-- GRANT USAGE ON SCHEMA geostore TO geostore ;
GRANT ALL PRIVILEGES ON SCHEMA geostore TO geostore ;

GRANT CONNECT ON DATABASE emotional TO geostore;
GRANT USAGE, CREATE ON SCHEMA public TO geostore;
ALTER DEFAULT PRIVILEGES GRANT ALL ON TABLES TO geostore;
ALTER DEFAULT PRIVILEGES GRANT ALL ON SEQUENCES TO geostore;


GRANT SELECT ON public.spatial_ref_sys to geostore;
GRANT SELECT,INSERT,DELETE ON public.geometry_columns to geostore;

alter user geostore set search_path to geostore , public;

SET search_path TO geostore;

create table gs_attribute (
        id int8 not null,
        attribute_date timestamp,
        name varchar(255) not null,
        attribute_number float8,
        attribute_text varchar(255),
        attribute_type varchar(255) not null,
        resource_id int8 not null,
        primary key (id),
        unique (name, resource_id)
    );

    create table gs_category (
        id int8 not null,
        name varchar(255) not null,
        primary key (id),
        unique (name)
    );

    create table gs_resource (
        id int8 not null,
        creation timestamp not null,
        description varchar(10000),
        lastUpdate timestamp,
        metadata varchar(30000),
        name varchar(255) not null,
        category_id int8 not null,
        primary key (id),
        unique (name)
    );

    create table gs_security (
        id int8 not null,
        canRead bool not null,
        canWrite bool not null,
        group_id int8,
        resource_id int8,
        user_id int8,
        username varchar(255),
        groupname varchar(255),
        primary key (id),
        unique (user_id, resource_id),
        unique (resource_id, group_id)
    );

    create table gs_stored_data (
        id int8 not null,
        stored_data varchar(10000000) not null,
        resource_id int8 not null,
        primary key (id),
        unique (resource_id)
    );

    create table gs_user (
        id int8 not null,
        name varchar(255) not null,
        user_password varchar(255),
        user_role varchar(255) not null,
        group_id int8,
		enabled char(1) NOT NULL DEFAULT 'Y',
        primary key (id),
        unique (name)
    );

    create table gs_user_attribute (
        id int8 not null,
        name varchar(255) not null,
        string varchar(255),
        user_id int8 not null,
        primary key (id),
        unique (name, user_id)
    );

    create table gs_usergroup (
        id int8 not null,
        groupName varchar(255) not null,
		description varchar(255),
		enabled char(1) NOT NULL DEFAULT 'Y',
        primary key (id),
        unique (groupName)
    );

     create table gs_user_group_attribute (
          id bigint not null,
          name varchar(255) not null,
          string varchar(255),
          userGroup_id bigint not null,
          primary key (id)
      );
	
	create table gs_usergroup_members (
		user_id int8 not null, 
		group_id int8 not null, 
		primary key (user_id, group_id)
	);
	
	alter table gs_usergroup_members 
		add constraint FKFDE460DB62224F72 
		foreign key (user_id) 
		references gs_user;
		
    alter table gs_usergroup_members 
		add constraint FKFDE460DB9EC981B7 
		foreign key (group_id) 
		references gs_usergroup;

    create index idx_attribute_name on gs_attribute (name);

    create index idx_attribute_resource on gs_attribute (resource_id);

    create index idx_attribute_text on gs_attribute (attribute_text);

    create index idx_attribute_type on gs_attribute (attribute_type);

    create index idx_attribute_date on gs_attribute (attribute_date);

    create index idx_attribute_number on gs_attribute (attribute_number);

    alter table gs_attribute 
        add constraint fk_attribute_resource 
        foreign key (resource_id) 
        references gs_resource;

    create index idx_user_group_attr_name on gs_user_group_attribute (name);

    create index idx_user_group_attr_text on gs_user_group_attribute (string);

    create index idx_attr_user_group on gs_user_group_attribute (userGroup_id);

    alter table gs_user_group_attribute add constraint fk_ugattrib_user_group foreign key (userGroup_id) references gs_usergroup;

    create index idx_category_type on gs_category (name);

    create index idx_resource_name on gs_resource (name);

    create index idx_resource_description on gs_resource (description);

    create index idx_resource_metadata on gs_resource (metadata);

    create index idx_resource_update on gs_resource (lastUpdate);

    create index idx_resource_creation on gs_resource (creation);

    create index idx_resource_category on gs_resource (category_id);

    alter table gs_resource 
        add constraint fk_resource_category 
        foreign key (category_id) 
        references gs_category;

    create index idx_security_resource on gs_security (resource_id);

    create index idx_security_user on gs_security (user_id);

    create index idx_security_group on gs_security (group_id);

    create index idx_security_write on gs_security (canWrite);

    create index idx_security_read on gs_security (canRead);
    
    create index idx_security_username on gs_security (username);
    
    create index idx_security_groupname on gs_security (groupname);

    alter table gs_security 
        add constraint fk_security_user 
        foreign key (user_id) 
        references gs_user;

    alter table gs_security 
        add constraint fk_security_group 
        foreign key (group_id) 
        references gs_usergroup;

    alter table gs_security 
        add constraint fk_security_resource 
        foreign key (resource_id) 
        references gs_resource;

    alter table gs_stored_data 
        add constraint fk_data_resource 
        foreign key (resource_id) 
        references gs_resource;

    create index idx_user_group on gs_user (group_id);

    create index idx_user_password on gs_user (user_password);

    create index idx_user_name on gs_user (name);

    create index idx_user_role on gs_user (user_role);

    alter table gs_user 
        add constraint fk_user_ugroup 
        foreign key (group_id) 
        references gs_usergroup;

    create index idx_user_attribute_name on gs_user_attribute (name);

    create index idx_user_attribute_text on gs_user_attribute (string);

    create index idx_attribute_user on gs_user_attribute (user_id);

    alter table gs_user_attribute 
        add constraint fk_uattrib_user 
        foreign key (user_id) 
        references gs_user;

    create index idx_usergroup_name on gs_usergroup (groupName);

    create sequence geostore.hibernate_sequence  START 14;

    INSERT INTO geostore.gs_category (id,"name") VALUES
     (1,'MAP'),
     (2,'THUMBNAIL'),
     (3,'DETAILS'),
     (4,'DASHBOARD'),
     (5,'GEOSTORY'),
     (6,'CONTEXT'),
     (7,'TEMPLATE'),
     (8,'USERSESSION');

INSERT INTO geostore.gs_user (id,"name",user_password,user_role,group_id,enabled) VALUES
     (11,'guest',NULL,'GUEST',NULL,'Y'),
     (12,'admin','digest1:3mwA1lcDpaRxtD4et7bSpx1olc8Hdvv6KLiTGT4tICpF7PirV0+QzGamzJEQa5pa','ADMIN',NULL,'Y'),
     (13,'user','digest1:zs9hRcyg0C5RXmqTSyBzS24U2fkBFJw4Y90/+pxMwqlr8P91TslPfoBk24BOh1KZ','USER',NULL,'Y');

     INSERT INTO geostore.gs_usergroup (id,groupname,description,enabled) VALUES
     (9,'everyone',NULL,'Y'),
     (10,'testGroup1','description','Y');

INSERT INTO geostore.gs_usergroup_members (user_id,group_id) VALUES
     (11,9),
     (12,9),
     (13,9);