/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/7/15 20:56:09                           */
/*==============================================================*/


drop table if exists area;

drop table if exists attr_group;

drop table if exists attribute;

drop table if exists brand;

drop table if exists category;

drop table if exists express;

drop index index_product_id on goods;

drop table if exists goods;

drop table if exists invoice;

drop table if exists order_address;

drop table if exists order_goods;

drop table if exists order_status;

drop table if exists packing_list;

drop table if exists payment;

drop table if exists product;

drop table if exists product_attr;

drop table if exists product_cat;

drop table if exists product_comment;

drop table if exists product_detail;

drop table if exists product_kind;

drop table if exists product_pic;

drop table if exists shop;

drop table if exists spec_attr;

drop table if exists trade_order;

drop table if exists user;

drop table if exists user_address;

drop table if exists user_integral;

drop table if exists user_rank;

/*==============================================================*/
/* Table: area                                                  */
/*==============================================================*/
create table area
(
   area_id              bigint not null auto_increment,
   area_name            varchar(50) comment '��Ʒ����ID',
   parent_id            bigint comment '�����',
   level                smallint comment '0 ȫ��
            1 ʡ
            2 ��
            3 ��/��',
   primary key (area_id)
);

alter table area comment '������';

/*==============================================================*/
/* Table: attr_group                                            */
/*==============================================================*/
create table attr_group
(
   attr_group_id        bigint not null auto_increment,
   kind_id              bigint,
   group_name           varchar(30),
   status               smallint comment '1 ����
            2 ��ɾ��',
   primary key (attr_group_id)
);

/*==============================================================*/
/* Table: attribute                                             */
/*==============================================================*/
create table attribute
(
   attr_id              bigint not null auto_increment,
   attr_group_id        bigint,
   kind_id              bigint comment '����ID',
   attr_name            varchar(50) comment '������',
   attr_values          varchar(200) comment '��ѡ����ֵ',
   attr_type            smallint comment '1����
            2������ѡ
            3��ѡ',
   create_time          datetime,
   update_time          datetime,
   primary key (attr_id)
);

/*==============================================================*/
/* Table: brand                                                 */
/*==============================================================*/
create table brand
(
   brand_id             bigint not null auto_increment,
   brand_name           varchar(10),
   url                  varchar(200),
   brand_desc           varchar(200),
   create_time          datetime,
   update_time          datetime,
   status               smallint comment '1 ����
            2 ��ɾ��',
   primary key (brand_id)
);

/*==============================================================*/
/* Table: category                                              */
/*==============================================================*/
create table category
(
   cat_id               bigint not null auto_increment,
   parent_id            bigint comment '������ID',
   name                 varchar(50) comment '������',
   status               smallint comment '1 ����
            2 ��ɾ��',
   sort_order           smallint comment '����',
   create_time          datetime,
   update_time          datetime,
   level                smallint comment '����Ϊ0',
   is_leaf              char(1) default 'n' comment 'y ��
            n ��',
   primary key (cat_id)
);

/*==============================================================*/
/* Table: express                                               */
/*==============================================================*/
create table express
(
   express_id           bigint not null auto_increment,
   express_name         varchar(50) comment '��ݹ�˾��',
   status               smallint comment '1 ����
            2 ��ɾ��',
   create_time          datetime,
   update_time          datetime,
   telephone            varchar(50) comment '��ϵ�绰',
   contact              varchar(30) comment '��ϵ��',
   contact_phone_num    varchar(30) comment '��ϵ���ֻ�',
   primary key (express_id)
);

alter table express comment '��ݹ�˾';

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   goods_id             bigint not null auto_increment,
   product_id           bigint,
   goods_sn             int comment '��Ʒ���к�',
   spec                 varchar(500) comment '��json��ʽ�洢��񣬱���{��ɫ����ɫ���ߴ磺xl}',
   stock                int comment '���',
   sales                int comment '����',
   price                int comment '�۸�',
   display_price        int comment 'ԭ��',
   create_time          datetime,
   update_time          datetime,
   version              int,
   product_pic_id       bigint,
   status               smallint comment '1 ����
            2 ��ɾ��',
   primary key (goods_id)
);

alter table goods comment 'sku ���ԣ��۸񣬿���';

/*==============================================================*/
/* Index: index_product_id                                      */
/*==============================================================*/
create index index_product_id on goods
(
   product_id
);

/*==============================================================*/
/* Table: invoice                                               */
/*==============================================================*/
create table invoice
(
   invoice_id           bigint not null auto_increment,
   type                 int comment '1����ͨ��Ʊ   2����ֵ��Ʊ',
   create_time          datetime,
   update_time          datetime,
   title                varchar(100) comment '��Ʊ̧ͷ',
   product_type         int comment '1���칫��Ʒ  2������Ʒ   3��ʳƷ',
   primary key (invoice_id)
);

alter table invoice comment '��Ʊ';

/*==============================================================*/
/* Table: order_address                                         */
/*==============================================================*/
create table order_address
(
   id                   bigint not null auto_increment,
   consigee             varchar(50) comment '�ջ���',
   phone_num            varchar(30) comment '�ջ��˵绰',
   post_code            varchar(10) comment '�ʱ�',
   address              varchar(200) comment '��ϸ��ַ',
   province             varchar(50) comment 'ʡ',
   city                 varchar(50) comment '��',
   county               varchar(50) comment '��',
   express_id           bigint comment '��ݹ�˾id',
   express_name         varchar(50) comment '��ݹ�˾��',
   express_no           varchar(50) comment '��ݵ���',
   primary key (id)
);

alter table order_address comment '������ַ��';

/*==============================================================*/
/* Table: order_goods                                           */
/*==============================================================*/
create table order_goods
(
   id                   bigint not null auto_increment,
   goods_id             bigint,
   price                int comment '�ɽ��۸�',
   quanity              int comment '�ɽ�����',
   create_time          datetime,
   update_time          datetime,
   goods_name           varchar(100) comment '��Ʒ����',
   primary key (id)
);

alter table order_goods comment '������Ʒ��';

/*==============================================================*/
/* Table: order_status                                          */
/*==============================================================*/
create table order_status
(
   id                   bigint not null auto_increment,
   order_id             bigint,
   status               smallint comment '״̬',
   remark               varchar(500) comment '˵��',
   create_time          datetime,
   pdate_time           datetime,
   primary key (id)
);

alter table order_status comment '����״̬��';

/*==============================================================*/
/* Table: packing_list                                          */
/*==============================================================*/
create table packing_list
(
   id                   bigint not null auto_increment,
   product_id           bigint not null,
   goods_name           varbinary(50) not null,
   num                  smallint not null,
   status               smallint not null comment '1 ����
            2 ��ɾ��',
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: payment                                               */
/*==============================================================*/
create table payment
(
   payment_id           bigint not null auto_increment,
   order_id             bigint,
   amount               varchar(50) comment '֧�����',
   status               smallint,
   create_time          datetime,
   update_time          datetime,
   pay_account          varchar(50) comment '����˺�',
   payer_name           varchar(50) comment '�������',
   primary key (payment_id)
);

alter table payment comment '֧����';

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create table product
(
   product_id           bigint not null auto_increment,
   kind_id              bigint,
   shop_id              bigint,
   shop_name            varchar(50) comment '�̵�����',
   product_name         varchar(100) comment '��Ʒ��,������ҳ�б�չʾ',
   product_title        varchar(500),
   brand_id             bigint comment 'Ʒ��ID',
   brand_name           varchar(50) comment 'Ʒ����',
   view_num             bigint comment '�����',
   status               int comment '1�ϼ�
            2 �¼�
            3 �����
            4��ɾ��',
   pay_type             int comment '0 ��������
            1 ����֧��
            2 ��֧��',
   delevery_amount      int,
   min_price            int comment '��ͬ����е���ͼ�',
   max_price            int comment '��ͬ����е���߼�',
   pic_url              varchar(100),
   comment_times        int,
   score                int,
   create_time          datetime,
   update_time          datetime,
   sales                int,
   primary key (product_id)
);

/*==============================================================*/
/* Table: product_attr                                          */
/*==============================================================*/
create table product_attr
(
   id                   bigint not null auto_increment,
   product_id           bigint not null,
   attr_group_id        bigint,
   attr_name            varchar(30) not null comment '������',
   attr_value           varchar(200) not null comment '����ֵ,����ǹ�����ԣ�����ֵ�Զ��ŷָ�',
   sort_order           smallint default 1000 comment '����ԽСԽ��ǰ',
   attr_type            smallint default 3 comment '1 �������
            2 ��������
            3 һ������',
   primary key (id)
);

alter table product_attr comment '��Ʒ���Ա�';

/*==============================================================*/
/* Table: product_cat                                           */
/*==============================================================*/
create table product_cat
(
   id                   bigint not null auto_increment,
   product_id           bigint,
   cat_id               bigint,
   create_time          datetime,
   update_time          datetime,
   sort_order           smallint,
   status               smallint comment '1 ����
            2 ��ɾ��',
   primary key (id)
);

alter table product_cat comment '��Ʒ����';

/*==============================================================*/
/* Table: product_comment                                       */
/*==============================================================*/
create table product_comment
(
   id                   bigint not null auto_increment,
   goods_id             bigint,
   order_id             bigint,
   user_id              bigint,
   user_name            varchar(100) comment '�û���',
   similar              smallint comment '�������',
   attitude             smallint comment '����̬��',
   speed                smallint comment '�����ٶ�',
   comment              varchar(500) comment '����',
   shop_reply           varbinary(500),
   status               smallint comment '1 ����
            2 ��ɾ��',
   create_time          datetime,
   update_time          datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: product_detail                                        */
/*==============================================================*/
create table product_detail
(
   detail_id            bigint not null auto_increment,
   product_id           bigint,
   description          varchar(20000),
   create_time          datetime,
   update_time          datetime,
   primary key (detail_id)
);

alter table product_detail comment '�����Ʒ��ϸ�������������ֶΣ��ֿ��洢';

/*==============================================================*/
/* Table: product_kind                                          */
/*==============================================================*/
create table product_kind
(
   kind_id              bigint not null auto_increment,
   type_name            varchar(50) comment '������',
   status               smallint comment '1 ����
            2 ��ɾ��',
   create_time          datetime,
   update_time          datetime,
   primary key (kind_id)
);

alter table product_kind comment '�ֻ������Եȣ��������������б�';

/*==============================================================*/
/* Table: product_pic                                           */
/*==============================================================*/
create table product_pic
(
   product_pic_id       bigint not null auto_increment,
   product_id           bigint not null,
   url                  varchar(100),
   image_name           varchar(50),
   post_fix             varchar(50),
   brief_name           varchar(50),
   use_type             smallint comment '1��������ҳͼƬ
            2������ҳ���չʾͼƬ
            3����Ӧ���goods��ͼƬ',
   status               SMALLINT comment '1����
            2��ɾ��',
   primary key (product_pic_id)
);

alter table product_pic comment '��ƷͼƬ��,������ϸҳ���չʾ�ļ�������ͼƬ';

/*==============================================================*/
/* Table: shop                                                  */
/*==============================================================*/
create table shop
(
   shop_id              bigint not null auto_increment,
   shop_name            bigint comment '������',
   link_men             varchar(50) comment '��ϵ��',
   phone_num            varchar(200) comment '��ϵ�绰',
   create_time          datetime,
   update_time          datetime,
   status               smallint comment '����״̬',
   primary key (shop_id)
);

alter table shop comment '�̵�';

/*==============================================================*/
/* Table: spec_attr                                             */
/*==============================================================*/
create table spec_attr
(
   spec_id              bigint not null auto_increment,
   kind_id              bigint comment '��Ʒ����ID',
   spec_name            varchar(50) comment '�����',
   spec_values          varchar(500) comment '���ֵ�����߷ָ�',
   create_time          datetime,
   update_time          datetime,
   primary key (spec_id)
);

alter table spec_attr comment '�磺��ɫ���Եĺ������';

/*==============================================================*/
/* Table: trade_order                                           */
/*==============================================================*/
create table trade_order
(
   order_id             bigint not null auto_increment,
   kind_id              bigint comment '��Ʒ����ID',
   user_name            varchar(50) comment '�û���',
   status               smallint comment '1  ��ʼ
            2 ֧����
            3 ֧���ɹ�
            4 �ѷ���
            5 ���׳ɹ�
            6 �˻�������
            7 ��ͬ���˻�
            8 �˻��ɹ�
            9 �ܾ��˻�',
   pay_type             char(1),
   amount               int comment '������� = ��Ʒ��� + ��ݷ���',
   delevery_amount      int comment '��ݷ�',
   integral             int comment 'Ӧ�����= �������-ʹ�û���',
   version              int,
   invoice_id           bigint comment '��Ʊid',
   remark               varchar(100) comment '�µ���ע',
   create_time          datetime,
   last_update_time     datetime,
   primary key (order_id)
);

alter table trade_order comment '���׶�����';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              bigint not null auto_increment,
   rank_id              bigint,
   user_name            varchar(50) comment '�û���',
   user_real_name       varchar(50) comment '�û���ʵ����',
   phone_num            varchar(30) comment '�ֻ���',
   mail                 varchar(50) comment '����',
   sex                  char(1) comment 'm ��
            f  Ů',
   status               smallint comment '1 ����
            2 �������û�',
   integral             int,
   create_time          datetime,
   update_time          datetime,
   primary key (user_id)
);

alter table user comment '��վ��Ա';

/*==============================================================*/
/* Table: user_address                                          */
/*==============================================================*/
create table user_address
(
   address_id           bigint not null auto_increment,
   user_id              bigint,
   province             varchar(50) comment 'ʡ',
   city                 varchar(50) comment '��',
   county               varchar(50) comment ' ��',
   create_time          datetime,
   update_time          datetime,
   post_code            varchar(50) comment '�ʱ�',
   address              varchar(200) comment '��ϸ��ַ',
   consignee            varchar(30) comment '�ռ�������',
   phone_num            varchar(30) comment '�ռ��˵绰',
   province_id          bigint comment 'ʡ����id',
   city_id              bigint comment '�е���id',
   conty_id             bigint comment '�ص���id',
   status               smallint comment '1 Ĭ�ϵ�ַ
            2 ���õ�ַ
            3 ��ɾ����ַ',
   primary key (address_id)
);

alter table user_address comment '�����ջ���ַ';

/*==============================================================*/
/* Table: user_integral                                         */
/*==============================================================*/
create table user_integral
(
   id                   bigint not null auto_increment,
   user_id              bigint,
   order_id             bigint,
   user_name            varchar(50) comment '�û���',
   create_time          datetime,
   update_time          datetime,
   integral             int comment '��������',
   type                 smallint comment '1 ��������
            2 �Ƽ�',
   remark               varchar(200),
   primary key (id)
);

alter table user_integral comment '��¼��Աÿ�ʻ���������¼';

/*==============================================================*/
/* Table: user_rank                                             */
/*==============================================================*/
create table user_rank
(
   rank_id              int not null,
   rank                 int comment '�ȼ���ֵ',
   rank_name            varchar(50) comment '�ȼ�����',
   create_time          datetime,
   update_time          datetime,
   status               smallint,
   primary key (rank_id)
);

alter table user_rank comment '��Ա�ȼ���';

alter table attribute add constraint FK_Reference_3 foreign key (kind_id)
      references product_kind (kind_id) on delete restrict on update restrict;

alter table goods add constraint FK_Reference_6 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_4 foreign key (brand_id)
      references brand (brand_id) on delete restrict on update restrict;

alter table product add constraint FK_Reference_9 foreign key (kind_id)
      references product_kind (kind_id) on delete restrict on update restrict;

alter table product_cat add constraint FK_Reference_11 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table product_cat add constraint FK_Reference_12 foreign key (cat_id)
      references category (cat_id) on delete restrict on update restrict;

alter table product_comment add constraint FK_Reference_14 foreign key (goods_id)
      references product (product_id) on delete restrict on update restrict;

alter table product_detail add constraint FK_Reference_13 foreign key (product_id)
      references product (product_id) on delete restrict on update restrict;

alter table spec_attr add constraint FK_Reference_10 foreign key (kind_id)
      references product_kind (kind_id) on delete restrict on update restrict;

