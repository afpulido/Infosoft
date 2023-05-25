### Base de datos Infosoft
    Drop database if exists infosoft;
    create database infosoft;
    use infosoft;

### TABLAS

    ### Tabla rol
    create table rol(
        rol_id int primary key identity(1,1), /* Zona */
        nombre varchar(10),
        descripcion varchar(45),
        fecha_creacion datetime default current_timestamp,
        fecha_eliminacion datetime,
        ultima_modificacion datetime default current_timestamp
    );
    
    ### Tabla usuario
    create table usuario(
        usuario_id int primary key,
        cedula int,
        nombre varchar (25),
        apellido varchar (25),
        contraseña varchar (45),
        rol_id int,
        fecha_creacion datetime default current_timestamp,
        fecha_eliminacion datetime,
        ultima_modificacion datetime default current_timestamp
    );

    ### Tabla que almacena las facturas diarias
    create table consolidado_diario(
        documento varchar(15) primary key,
        tipo_doc varchar(10),
        articulo varchar(18),
        condicion_id int,
        usuario_id int,
        precio total int,
        fecha_creacion datetime default current_timestamp,
        fecha_eliminacion datetime,
        ultima_modificacion datetime default current_timestamp
    );

    ### Tabla que almacena las condiciones de pago
    create table condicion_pago(
        condicion_id int primary key,
        descripcion varchar (45),
        dias_neto int,
        fecha_creacion datetime default current_timestamp,
        fecha_eliminacion datetime,
        ultima_modificacion datetime default current_timestamp
    )

### Llaves foraneas

ALTER TABLE usuario ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES rol(rol_id);

ALTER TABLE consolidado_diario ADD CONSTRAINT fk_consolidado_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id);

ALTER TABLE consolidado_diario ADD CONSTRAINT fk_consolidado_condicion_pago FOREIGN KEY (condicion_id) REFERENCES condicion_pago(condicion_id);



