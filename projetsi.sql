create table posi(
    libelle varchar(30) not null,
    id integer not null,
    CONSTRAINT pk_posi PRIMARY KEY (id),
    constraint unique_libelle unique (libelle)
);
create table utilisateur(
    login integer not null,
    rol integer not null,
    mdp varchar(100),
    constraint pk_utilisateur primary key (login),
    constraint fk_posi foreign key (rol) references posi(id)
)
insert into posi(id,libelle) values(1,'etudiant');
insert into posi(id,libelle) values(2,'professeur');
insert into posi(id,libelle) values(3,'admin');
declare 
    logi utilisateur.login%type;
    ro utilisateur.rol%type;
    pwd utilisateur.mdp%type;
begin
    delete from utilisateur;
    for i in 1 .. 50 loop
        select trunc(dbms_random.value(1,4)) into ro FROM dual;
        select dbms_random.string('u',30) into pwd from dual;
        insert into utilisateur(login,rol,mdp) values (i,ro,pwd);
    end loop;
end;