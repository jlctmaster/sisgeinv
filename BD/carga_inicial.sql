/** INITIAL CHARGE OF DATA **/

-- INSERT INITIAL DATA FOR COMPANY 
INSERT INTO tcompania (crif_compania,cnombre,cemail) VALUES ('J000000000','EDUARDO COMPUTACIÓN,\"EL DR. DE LAS COMPUTADORAS\"','EDUARDO_COMPUTACION@GMAIL.COM');
-- INSERT INITIAL DATA FOR PERSON
INSERT INTO tpersona (crif_persona,cnombre) VALUES ('V00000000','ADMINISTRADOR DEL SISTEMA');
-- INSERT INITIAL DATA FOR CONFIGURATION PERFIL
INSERT INTO tconfiguracion (cnombre) VALUES ('POR DEFECTO');
-- INSERT INITIAL DATA FOR PERFIL
INSERT INTO tperfil (cnombre,nid_configuracion) VALUES ('ADMINISTRADOR',1);
-- INSERT INITIAL DATA FOR USER
INSERT INTO tusuario (cnombre_usuario,crif_persona,nid_perfil) VALUES ('ADMINV00000000','V00000000',1);
-- INSERT INITIAL DATA FOR PASSWORD OF USER DEFAULT '12345678'
INSERT INTO tcontrasena (cnombre_usuario,ccontrasena,nestado) VALUES ('ADMINV00000000','1f82ea75c5cc526729e2d581aeb3aeccfef4407e',1);
-- INSERT INITIAL DATA FOR MODULE 
INSERT INTO tmodulo (cnombre,cicono,norden) VALUES ('SEGURIDAD','icon-lock',8);
-- INSERT INITIAL DATA FOR SERVICES 
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('COMPAÑÍA','COMPANIA',1,1);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('CONFIG. SISTEMA','CONFIGURACION',1,2);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('MÓDULO','MODULO',1,3);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('SERVICIOS','SERVICIO',1,4);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('BOTONERA','BOTONES',1,5);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('PERFIL','PERFILES',1,6);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('NUEVO USUARIO','NUEVOUSUARIO',1,7);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('MÍ PERFIL','PERFIL',1,8);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('CAMBIAR CONTRASEÑA','CAMBIARCONTRASENA',1,9);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('DESBLOQUEAR USUARIO','DESBLOQUEARUSUARIO',1,10);
INSERT INTO tservicio (cnombre,curl,nid_modulo,norden) VALUES ('HISTÓRICO DE CAMBIOS','BITACORA',1,11);
-- INSERT INITIAL DATA FOR OPTIONS FORMS
INSERT INTO topcion (cnombre,cicono,norden,naccion) VALUES ('INSERTAR','icon-pencil',1,1);
INSERT INTO topcion (cnombre,cicono,norden,naccion) VALUES ('ACTUALIZAR','icon-edit',2,2);
INSERT INTO topcion (cnombre,cicono,norden,naccion) VALUES ('DESACTIVAR','icon-eye-close',3,3);
INSERT INTO topcion (cnombre,cicono,norden,naccion) VALUES ('ACTIVAR','icon-eye-open',4,4);
INSERT INTO topcion (cnombre,cicono,norden,naccion) VALUES ('CONSULTAR','icon-search',5,5);
-- INSERT INITIAL DATA FOR DETAIL ACCESS OPTION-SERVICE-PERFIL
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (1,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (1,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (1,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (1,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (1,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (2,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (2,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (2,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (2,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (2,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (3,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (3,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (3,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (3,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (3,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (4,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (4,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (4,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (4,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (4,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (5,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (5,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (5,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (5,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (5,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (6,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (6,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (6,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (6,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (6,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (7,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (7,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (7,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (7,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (7,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (8,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (8,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (8,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (8,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (8,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (9,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (9,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (9,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (9,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (9,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (10,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (10,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (10,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (10,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (10,1,5);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (11,1,1);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (11,1,2);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (11,1,3);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (11,1,4);
INSERT INTO tdetalle_servicio_perfil_opcion (nid_servicio,nid_perfil,nid_opcion) VALUES (11,1,5); 
