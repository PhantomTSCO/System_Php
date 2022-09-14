<?php
  require_once('../config/config.php');
   $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
  class Conexion
  {
    
    public static function conect() {
      $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
      // Check connection
      if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
      }else{
        echo "Connected successfully";
      }

    }

    public static function getEJ($trabajo){
      $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);

      $sqlPro="Call sp_Look_Job2('".$trabajo."',@Res)";
      $res=mysqli_query($conn,$sqlPro);
      $info=Conexion::last_Re();
      if ($info>0) {
         $arrayResult = array();
         
           while ($obj=$res->fetch_object()) {
           array_push($arrayResult, $obj);
             }
        
           return $arrayResult;
      }else{
        $arrayE = array();
        return $arrayE;
      }
      
      }

      public static function newE($name,$lastN,$trabajo,$genero,$edad,$dateB){
        $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
        $sqlPro="Call sp_New_E2('".$name."','".$lastN."','".$trabajo."','".$genero."',".$edad.",'".$dateB."',@Res)";

        $res=mysqli_query($conn,$sqlPro);

        $info=Conexion::last_Re();
        return $info;
      }

      public static function getH($name,$lastN,$horas,$fecha){
      $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
      $sqlPro="Call sp_Add_Times2('".$name."','".$lastN."','".$horas."','".$fecha."',@Res)";

      $res=mysqli_query($conn,$sqlPro);

        $info=Conexion::last_Re();
        return $info;

     }

     public static function getTH($name,$lastN,$fecha1,$fecha2){
      $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
      $sqlPro="Call sp_Add_WH2('".$name."','".$lastN."','".$fecha1."','".$fecha2."',@Res)";

      $res=mysqli_query($conn,$sqlPro);

        $info=Conexion::last_Re();
        return $info;

     }

     public static function getP($name,$lastN,$fecha1,$fecha2){
      $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
      $sqlPro="Call sp_Add_Pay2('".$name."','".$lastN."','".$fecha1."','".$fecha2."',@Res)";
      echo $sqlPro;
      $res=mysqli_query($conn,$sqlPro);

        $info=Conexion::last_Re();
        return $info;

     }

     public static function last_Re(){
      $conn = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
      $sqlPro="Call sp_Last_Re()";
      if($res=mysqli_query($conn,$sqlPro)){

        $row=mysqli_fetch_assoc($res);
          $arrayResult=$row['Result'];
          
          return $arrayResult;
        
      }
  }
  }
  
?>
