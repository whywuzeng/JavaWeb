create table wz_category
(
  cid   varchar(18) not null
    primary key,
  cname varchar(10) null,
  cdec  varchar(32) null
);

create table wz_product
(
  pid          varchar(18) not null
    primary key,
  pname        varchar(18) null,
  market_price varchar(10) null,
  shop_price   varchar(10) null,
  pimage       varchar(10) null,
  pdec         varchar(18) null,
  pflag        varchar(6)  null,
  cid          varchar(18) null,
  constraint wz_product_wz_category_cid_fk
  foreign key (cid) references wz_category (cid)
);

create table wz_usertable
(
  userid          int         not null
    primary key,
  username        varchar(8)  null,
  password        varchar(32) null,
  name            varchar(5)  null,
  email           varchar(12) null,
  sex             varchar(2)  null,
  birthday        varchar(10) null,
  telephonenumber varchar(12) null,
  code            varchar(32) null,
  state           varchar(3)  null
);

create table wz_orders
(
  oid        varchar(18) not null
    primary key,
  oridertime varchar(10) null,
  totalmoney varchar(15) null,
  name       varchar(4)  null,
  telephone  varchar(12) null,
  addres     varchar(13) null,
  state      varchar(3)  null,
  userid     int         not null,
  constraint wz_orders_wz_usertable_userid_fk
  foreign key (userid) references wz_usertable (userid)
);

create table wz_orderitem
(
  orderitemid varchar(10) not null
    primary key,
  count       varchar(8)  null,
  subtotal    varchar(8)  null,
  oid         varchar(18) null,
  pid         varchar(18) null,
  constraint wz_orderitem_wz_orders_oid_fk
  foreign key (oid) references wz_orders (oid),
  constraint wz_orderitem_wz_product_pid_fk
  foreign key (pid) references wz_product (pid)
);


