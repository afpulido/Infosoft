<?php 
require_once("conexion.php"); 
class crud extends Conexion{
    private $pdo;
    public function __construct(
        public string $tabla
    )
    {
        $this->pdo = $this->conexion(); 
    }
    public function consultarTodo(){
        try{
            $stm = $this->pdo->prepare("SELECT * FROM $this->tabla");
            $stm->execute();
            return $stm->fetchAll(PDO::FETCH_OBJ);
        }catch(PDOException $mensaje){
            echo $mensaje->getMessage();
        }
    }
    public function consultarUno(string $id, string $pk){
        try{
            $stm = $this->pdo->prepare("SELECT * FROM $this->tabla WHERE $pk= ?");
            $stm->execute([$id]);
            return $stm->fetch(PDO::FETCH_OBJ);
        }catch(PDOException $mensaje){
            echo $mensaje->getMessage();
        }
    }
    public function delete(string $id, string $pk){
        try{
            $stm = $this->pdo->prepare("DELETE FROM $this->tabla WHERE $pk= ?");
            $stm->execute([$id]);
            return $stm->fetch(PDO::FETCH_OBJ);
        }catch(PDOException $mensaje){
            echo $mensaje->getMessage();
        }
    }
    public function crear(string $columnas,string $marcadores,array $datos){
        $stm = $this->pdo->prepare("INSERT INTO $this->tabla $columnas VALUES $marcadores");
        $stm->execute($datos);
    }
    public function modificar(string $columnas,string $pk,string $id){
        $stm = $this->pdo->prepare("UPDATE $this->tabla SET $columnas WHERE $pk=?");
        $stm->execute([$id]);
    }
    }

?>