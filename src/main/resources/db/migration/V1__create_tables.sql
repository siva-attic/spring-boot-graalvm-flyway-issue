create table users
(
    id         bigserial    not null,
    email      varchar(255) not null,
    password   varchar(255) not null,
    name       varchar(255) not null,
    role       varchar(20)  not null,
    created_at timestamp    not null,
    updated_at timestamp,
    primary key (id),
    constraint user_email_unique unique (email)
);

create table posts
(
    id               bigserial    not null,
    title            varchar(150) not null,
    slug             varchar(500) not null,
    short_desc       varchar(500) not null,
    markdown_content text         not null,
    html_content     text         not null,
    created_by       bigint       not null references users (id),
    created_at       timestamp    not null,
    updated_at       timestamp,
    primary key (id)
);

create table comments
(
    id         bigserial    not null,
    post_id    bigint       not null references posts (id),
    email      varchar(150) not null,
    name       varchar(150) not null,
    content    text         not null,
    created_at timestamp    not null,
    updated_at timestamp,
    primary key (id)
);

alter sequence users_id_seq restart with 101;
alter sequence posts_id_seq restart with 101;
alter sequence comments_id_seq restart with 101;
