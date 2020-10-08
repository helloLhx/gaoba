/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/10/8 16:08:46                           */
/*==============================================================*/


drop table if exists sff_banzu;

drop table if exists sff_conductor;

drop table if exists sff_ex;

drop table if exists sff_position;

/*==============================================================*/
/* Table: sff_banzu                                             */
/*==============================================================*/
create table sff_banzu
(
   railway_name         varchar(20) comment '铁路局名称:',
   pt_section           varchar(20) comment '客运段名称: ',
   company_name         varchar(20) comment '分公司名称:   ',
   banzu_number         varchar(20) comment '班组编号:',
   railway_class        int comment '列车类型:0：快速（K）1：特快（T）2：直达（Z）3：高铁
            4：动车5：城际6：普快',
   banzu_class          int comment '班组类型:',
   banzu_name           varchar(20) comment '班组名:',
   groupl_name          varchar(20) comment '组长姓名:    ',
   members_name         varchar(20) comment '组员姓名:   ',
   hot_banzu            int comment '是否热备班组:0：否；1：是',
   status               int comment '状态:0:禁用；1：可用',
   bak_note             varchar(500) comment '备注:',
   p_id                 int not null auto_increment comment '主键自增id',
   primary key (p_id)
);

alter table sff_banzu comment '班组表跟车次表相关联，是多对一的关系，即多个班组可以对应一种列车类型；
列车员表跟班组表相关联，也是多对一的';

/*==============================================================*/
/* Table: sff_conductor                                         */
/*==============================================================*/
create table sff_conductor
(
   login_number         varchar(20) comment '登录账号',
   account_name         varchar(20) comment '用户姓名',
   dept_class           int comment '状态开关：0：总公司；1：分工司',
   railway_name         varchar(20) comment '铁路局名称',
   pt_section           varchar(20) comment '客运段名称',
   company_name         varchar(20) comment '分公司名称',
   status               int comment '状态开关：0：禁用；1：可用',
   bak_note             varchar(500) comment '备注',
   position             varchar(20) comment '职务',
   p_id                 int not null comment '主键自增id',
   sff_p_id             int comment '主键自增id',
   primary key (p_id)
);

alter table sff_conductor comment '列车员表与职务表相关联表现在字段 --职务；是多对一的表关系；即多个列车员对应一个职务；';

/*==============================================================*/
/* Table: sff_ex                                                */
/*==============================================================*/
create table sff_ex
(
   p_id                 bigint not null comment '主键自增id',
   car_number           int(18) comment '身份证号码',
   phone_number         int(11) comment '手机号',
   sex                  int comment '0：女1：男',
   work_status          int comment '0：离职1：在职',
   primary key (p_id)
);

alter table sff_ex comment '员工扩展信息；跟列车员表是一对一的表关系；即一个列车员对应一个扩展信息，如一个列车员只有一个身份证；';

/*==============================================================*/
/* Table: sff_position                                          */
/*==============================================================*/
create table sff_position
(
   position_id          int(10) comment '职务id',
   position_name        varchar(50) comment '职务名称',
   using_isn            int comment '状态开关字段：0：停用；1：启用；',
   create_time          date default CURRENT_TIMESTAMP comment '创建时间',
   p_id                 int not null auto_increment comment '主键自增id',
   primary key (p_id)
);

alter table sff_position comment '修改时间主键自增id;
职务id; 职务名称; 是否启用; 创建时间--列表展示
';

