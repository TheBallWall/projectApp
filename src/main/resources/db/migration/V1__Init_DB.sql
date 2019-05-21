 alter table if exists card drop constraint if exists FKfklks4pup2r1ni8v0g5in9ee8;
 alter table if exists card_in_pack drop constraint if exists FKrsjil4hq0xpxsiy1xs11i65er;
 alter table if exists card_in_pack drop constraint if exists FKfo28ky9uraomydkh9c5x02bdy;
 alter table if exists session drop constraint if exists FK3swxrl73d4cfo8wxmecldctce;
 alter table if exists tag_to_pack drop constraint if exists FKyos7oeenm0u8bxcnxp64m7q;
 alter table if exists tag_to_pack drop constraint if exists FK967qkvcfrh4etyppwu4r0uldr;
 alter table if exists user_role drop constraint if exists FKfpm8swft53ulq2hl11yplpr5;
 alter table if exists user_session drop constraint if exists FK24awle4e1qshvutpj2prrv4vt;
 alter table if exists user_session drop constraint if exists FKnf484mba2ygws6an9a0xqvada;
 alter table if exists usr_packs drop constraint if exists FK90gni32pdjwq61j83acnx51jq;
 alter table if exists usr_packs drop constraint if exists FKiardga7vc3tmiqv5f8rekkclu;
 drop table if exists card cascade;
 drop table if exists card_in_pack cascade;
 drop table if exists pack cascade;
 drop table if exists session cascade;
 drop table if exists session_row cascade;
 drop table if exists tag cascade;
 drop table if exists tag_to_pack cascade;
 drop table if exists user_role cascade;
 drop table if exists user_session cascade;
 drop table if exists usr cascade;
 drop table if exists usr_packs cascade;
 create table card (id uuid not null, answer varchar(255), question varchar(255), user_id uuid, next_practice_time timestamp, last_time_easy timestamp, primary key (id));
 create table card_in_pack (pack_id uuid not null, card_id uuid not null, primary key (pack_id, card_id));
 create table pack (id uuid not null, author_id uuid, created timestamp, is_public boolean, likes int4, name varchar(255), parent_id int4, primary key (id));
 create table session (id uuid not null, user_id uuid not null, start_time timestamp, finish_time timestamp, is_Active boolean, primary key (id));
 create table session_row (id uuid not null, answer int4, card_id uuid, answered timestamp, session_id uuid, primary key (id));
 create table tag (id uuid not null, tag varchar(255), primary key (id));
 create table tag_to_pack (pack_id uuid not null, tag_id uuid not null, primary key (pack_id, tag_id));
 create table user_role (user_id uuid not null, roles varchar(255));
 --create table user_session (session_id uuid not null, user_id uuid not null, primary key (session_id,user_id));
 create table usr (id uuid not null, activation_code varchar(255), active boolean not null, avatar varchar(255), email varchar(255), first_name varchar(255), last_name varchar(255), password varchar(255), username varchar(255), primary key (id));
 create table usr_packs (pack_id uuid not null, usr_id uuid not null, PRIMARY KEY (pack_id,usr_id));
 alter table if exists card add constraint FKfklks4pup2r1ni8v0g5in9ee8 foreign key (user_id) references usr;
 alter table if exists card_in_pack add constraint FKrsjil4hq0xpxsiy1xs11i65er foreign key (card_id) references card;
 alter table if exists card_in_pack add constraint FKfo28ky9uraomydkh9c5x02bdy foreign key (pack_id) references pack;
 alter table if exists session add constraint FK3swxrl73d4cfo8wxmecldct2e foreign key (user_id) references usr;

 alter table if exists tag_to_pack add constraint FKyos7oeenm0u8bxcnxp64m7q foreign key (tag_id) references tag;
 alter table if exists tag_to_pack add constraint FK967qkvcfrh4etyppwu4r0uldr foreign key (pack_id) references pack;
 alter table if exists user_role add constraint FKfpm8swft53ulq2hl11yplpr5 foreign key (user_id) references usr;
 --alter table if exists user_session add constraint FK24awle4e1qshvutpj2prrv4vt foreign key (user_id) references usr;
 --alter table if exists user_session add constraint FKnf484mba2ygws6an9a0xqvada foreign key (session_id) references session;
 alter table if exists usr_packs add constraint FK90gni32pdjwq61j83acnx51jq foreign key (usr_id) references usr;
 alter table if exists usr_packs add constraint FKiardga7vc3tmiqv5f8rekkclu foreign key (pack_id) references pack;