insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('ZFJL', '���׼�¼', '/record/search.htm', 'ZFPTGL', 2, 0, 2);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('ZFYHGL', '֧�����й���', '/bank/search.htm', 'XTGL', 2, 0, 6);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('ZFPTGL', '֧��ƽ̨����', null, '0', 1, 4, 1);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('THGL', '�˻�����', '/refund/search.htm', 'ZFPTGL', 2, 0, 4);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('XTGL', 'ϵͳ����', null, '0', 1, 7, 5);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('SZMX', '��֧��ϸ', '/item/search.htm', 'ZFPTGL', 2, 0, 3);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('SHGL', '�̻�����', '/business/search.htm', 'XTGL', 2, 0, 7);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('XTRZ', 'ϵͳ������־', '/log/querylogs.htm', 'XTGL', 2, 0, 9);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('GNCDGL', '���ܲ˵�����', '/menu/querymenus.htm', 'XTGL', 2, 0, 3);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('QXZGL', 'Ȩ�������', '/rolegl/queryroles.htm', 'XTGL', 2, 0, 5);
insert into SYS_MENU (code, title, url, parent_code, menu_level, children_count, display_num)
values ('CZYGL', '����Ա����', '/operator/searchoperators.htm', 'XTGL', 2, 0, 1);
commit;

insert into SYS_ROLE (code, title, remark)
values ('ROLE_ADMIN', 'ϵͳ����Ա��', 'ϵͳ����Ա��');
commit;

insert into SYS_OPERATOR (operator_id, password, name, mobile_num, tele_num, email, status, job_name, remark, last_time, last_ip)
values ('admin', '21232f297a57a5a743894a0e4a801fc3', '����Ա', '133258711111', '025-582144212', null, '1', null, null, to_date('06-03-2012 14:38:18', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1');
commit;

insert into SYS_OPERATOR_ROLE (id, operator_id, role_code)
values ('f9edd715d7b54020bd53fe3a7a30694a', 'admin', 'ROLE_ADMIN');
commit;

insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('5cc1e7dfb16847ebacaf5e1fdb9d97d2', 'XTGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('25acbb56a06445dfa8be8e402806a39d', 'SHGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('b0045ffa58cc4c45b8144f08b3e230ac', 'ZFYHGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('123385b0d6c441ccbad260db6d5fd33c', 'CZYGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('aa7b518f995e47a5a774a3cb63d543a4', 'XTRZ', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('0a074274109543f9968bfd5ceb1384ea', 'GNCDGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('0b14caabd19b409fb7da61d90740f2ca', 'QXZGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('db8d73234c904925908be21f263df8a1', 'ZFPTGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('d0b680d37118462e8eef9f2b27b46354', 'THGL', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('beb0c823c8184b9abf12b193cf27a4ee', 'SZMX', 'ROLE_ADMIN');
insert into SYS_MENU_ROLE (id, menu_code, role_code)
values ('053fa39d74bc405aa9bd083d99ea17d9', 'ZFJL', 'ROLE_ADMIN');
commit;

insert into PAY_BUSINESS (id, password, name, site, remark, key, scale)
values ('0001', 'e10adc3949ba59abbe56e057f20f883e', '��ͨ�Ҽҵ����̳�', 'http://dd.dd.com', '��ͨ�Ҽҵ����̳�', 'd6cc50b2', 0.00);
commit;


insert into PAY_BANK (id, code, name, pay_type, rate, is_debit, is_credit, is_enterpise, logo_path, web_site, remark, dispaly_order, is_active)
values ('8d00175aa9a5456b9f8d67911db2d001', 'UNION', '����', 5, 0.05, 1, 1, 1, 'bank_CNPY.png', 'www.cnpy.com', '�������֧��', 3, 1);
insert into PAY_BANK (id, code, name, pay_type, rate, is_debit, is_credit, is_enterpise, logo_path, web_site, remark, dispaly_order, is_active)
values ('8d00175aa9a5456b9f8d67911db2d999', 'CMB', '��������', 5, 0.05, 1, 1, 1, 'bank_CMB.png', 'www.cmb.com', '�����������֧��', 1, 1);
insert into PAY_BANK (id, code, name, pay_type, rate, is_debit, is_credit, is_enterpise, logo_path, web_site, remark, dispaly_order, is_active)
values ('0161420718f94d528ff38f274abe6999', 'CCB', '��������', 5, 0.05, 1, 1, 1, 'bank_CCB.png', 'www.ccb.com', '��罨������֧��', 2, 1);
commit;


