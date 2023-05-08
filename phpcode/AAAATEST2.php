<!DOCTYPE html>
<html>
  <head>
  <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, textarea, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      line-height: 22px;
      }
      h1 {
      position: absolute;
      margin: 0;
      line-height: 55px;
      font-size: 55px;
      color: #fff;
      z-index: 2;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 20px;
      }
      form {
      width: 100%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 30px 0 #a37547; 
      }
      .banner {
      position: relative;
      height: 230px;
      background-image: url("/uploads/media/default/0001/02/3dd647f39593e88f45f61aaac6ff3027dce15506.jpeg");  
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }
      .banner::after {
      content: "";
      background-color: rgba(0, 230, 64, 1); 
      position: absolute;
      width: 100%;
      height: 100%;
      }
      input, select, textarea {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }
      input {
      width: calc(100% - 10px);
      padding: 5px;
      }
      select {
      width: 100%;
      padding: 7px 0;
      background: transparent;
      }
      textarea {
      width: calc(100% - 12px);
      padding: 5px;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder {
      color: #a37547;
      }
      .item input:hover, .item select:hover, .item textarea:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 6px 0 #a37547;
      color: #a37547;
      }
      .item {
      position: relative;
      margin: 10px 0;
      }
      input[type=radio], input[type=checkbox]  {
      display: none;
      }
      label.radio {
      position: relative;
      display: inline-block;
      margin: 5px 20px 15px 0;
      cursor: pointer;
      }
      .question span {
      margin-left: 30px;
      }
      label.radio:before {
      content: "";
      position: absolute;
      left: 0;
      width: 17px;
      height: 17px;
      border-radius: 50%;
      border: 2px solid #ccc;
      }
      input[type=radio]:checked + label:before, label.radio:hover:before {
      border: 2px solid #a37547;
      }
      label.radio:after {
      content: "";
      position: absolute;
      top: 6px;
      left: 5px;
      width: 8px;
      height: 4px;
      border: 3px solid #a37547;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=radio]:checked + label:after {
      opacity: 1;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      color: #fff;
      }
      button {
      width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background: #6b4724;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }
      button:hover {
      box-shadow: 0 0 18px 0 #3d2914;
      }
      @media (min-width: 568px) {
      .name-item, .city-item {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .name-item input, .city-item input {
      width: calc(50% - 20px);
      }
      .city-item select {
      width: calc(50% - 8px);
      }
      }
    </style>
  </head>
  <body>
    <div class="testbox">
    <form method="post">
      <div class="banner">
        <h1>FILLUP YOUR RESPONSE</h1>
      </div>
      <div class="item">
        <p> DATE</p>
        <input type=date size="50" name="complaint_date"min=<?php echo date('y-m-d');?>placeholder="complaint_date" autocomplete="off" required><br><br>
<script>
var today = new Date().toISOString().split('T')[0];
document.getElementsByName("complaint_date")[0].setAttribute('min', today);
</script>
           </div>
      <div class="item">
        <p>YOUR RESPONSE</p>
        <input type="text" size="50" style=height:200px; name="response" placeholder="response" required><br><br>
      </div>
     
        <div class="btn-block">
        <input type="submit" name="submit" placeholder="submit" style="font-size:25 pt;color:white;background-color:green;border:2px solid #336600;padding:3px"><br>
        </div>
    </form>
    </div>
  </body>
</html>
<?php
session_start();
if (isset($_REQUEST['submit'])){
   include 'database.php';
   $UID= $_REQUEST['uid'];
   $OID= $_REQUEST['oid'];
   $DID= $_REQUEST['did'];
   $DATE=$_REQUEST['date'];
   $RESPONSE=$_REQUEST['response'];
    $qry="insert into orphanage_response (uid,oid,did,date,response) values('$UID','$OID','$DID','$DATE','$RESPONSE')" ;
    echo $qry;
    if( mysqli_query($con, $qry)==TRUE){
      ?>
      <script>
      alert("submitted successfully");                         
      </script>
      <?php
   }else{
      ?>
         <script>
         alert("submission failed")
          </script>
          <?php
   }
} 
?>