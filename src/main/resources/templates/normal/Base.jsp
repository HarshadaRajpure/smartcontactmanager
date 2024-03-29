<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" th:fragment="layout(content)">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- font awesome icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
    <title th:text="${title}">Base HTML</title>
    
     <link rel="stylesheet" href="" th:href="@{/css/mystyle.css}" /> 
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    
    <link rel="icon" th:href="@{'/img/Contact_logo.jpg'}"  />
  </head>
  <body>
	
	<!-- navbar -->
	<nav class="fixed-top navbar navbar-expand-lg navbar-dark bg-primar">
  <div class="container-fluid">
    <a class="navbar-brand text-white" >Smart Contact Manager</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav ms-auto text-uppercase">
        <li class="nav-item"><a class="nav-link active" aria-current="page" th:href="@{/user/index}">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href="#"  ><span th:text="${user.name}"></span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" th:href="@{/logout}" >Logout</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>

<!-- End of Navbar -->

	<!-- side bar -->
	<div class="sidebar mt-2">
		
		<span onclick="toggleSidebar()" class="crossBtn" > &times; </span>
		
		<a href="#" th:href="@{/user/index}" class="item"> <i class="fa-solid fa-house"></i> Home</a>
		<a href="#" th:href="@{/user/show-contacts/0}" class="item"><i class="fa-solid fa-address-card"></i> View Contacts</a>
		<a href="#" th:href="@{/user/add-contact}" class="item"><i class="fa-solid fa-user-pen"></i> Add Contact</a>
		<a href="#" class="item" th:href="@{/user/profile}" ><i class="fa-solid fa-circle-user"></i> Your profile</a>
		<a href="#" class="item"><i class="fa-solid fa-gear"></i> Settings</a>
		<a href="#" th:href="@{/logout}" class="item"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
		
		<div class="divider"></div>
	</div>
	<!-- End of side bar -->
	
	<!-- Content Area -->
	<div class="content mt-5">
	
		<i onclick="toggleSidebar()" class="fas fa-bars m-3 pointer" ></i>
		
			<!-- Message box -->
			<div class="container" th:if="${session.message}">
			
				<div th:classappend="${session.message.type}" class="alert text-center" role="alert">
					 <span th:text="${session.message.content}"></span>
				</div>
			
				<th:block th:text="${#session.removeAttribute('message')}"> </th:block>
			</div>
			
		
		<div th:replace="${content}"> </div>
	
	</div>
    <!-- End of Content Area-->
     
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" th:src="@{/js/script.js}"></script>
   
    
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    function deleteContact(cid){
		swal({
			  title: "Are you sure?",
			  text: "You want to delete this contact...?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			  		window.location ="/user/delete/"+cid;
			    });
			  } else {
			    swal("Your Contact is safe !!");
			  }
			});
}
    </script>
    
  </body>
</html><!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" th:fragment="layout(content)">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- font awesome icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
   
    <title th:text="${title}">Base HTML</title>
    
     <link rel="stylesheet" href="" th:href="@{/css/mystyle.css}" /> 
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    
    <link rel="icon" th:href="@{'/img/Contact_logo.jpg'}"  />
  </head>
  <body>
	
	<!-- navbar -->
	<nav class="fixed-top navbar navbar-expand-lg navbar-dark bg-primar">
  <div class="container-fluid">
    <a class="navbar-brand text-white" >Smart Contact Manager</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    
      <ul class="navbar-nav ms-auto text-uppercase">
        <li class="nav-item"><a class="nav-link active" aria-current="page" th:href="@{/user/index}">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href="#"  ><span th:text="${user.name}"></span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" th:href="@{/logout}" >Logout</a>
        </li>
      </ul>
      
    </div>
  </div>
</nav>

<!-- End of Navbar -->

	<!-- side bar -->
	<div class="sidebar mt-2">
		
		<span onclick="toggleSidebar()" class="crossBtn" > &times; </span>
		
		<a href="#" th:href="@{/user/index}" class="item"> <i class="fa-solid fa-house"></i> Home</a>
		<a href="#" th:href="@{/user/show-contacts/0}" class="item"><i class="fa-solid fa-address-card"></i> View Contacts</a>
		<a href="#" th:href="@{/user/add-contact}" class="item"><i class="fa-solid fa-user-pen"></i> Add Contact</a>
		<a href="#" class="item" th:href="@{/user/profile}" ><i class="fa-solid fa-circle-user"></i> Your profile</a>
		<a href="#" class="item"><i class="fa-solid fa-gear"></i> Settings</a>
		<a href="#" th:href="@{/logout}" class="item"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
		
		<div class="divider"></div>
	</div>
	<!-- End of side bar -->
	
	<!-- Content Area -->
	<div class="content mt-5">
	
		<i onclick="toggleSidebar()" class="fas fa-bars m-3 pointer" ></i>
		
			<!-- Message box -->
			<div class="container" th:if="${session.message}">
			
				<div th:classappend="${session.message.type}" class="alert text-center" role="alert">
					 <span th:text="${session.message.content}"></span>
				</div>
			
				<th:block th:text="${#session.removeAttribute('message')}"> </th:block>
			</div>
			
		
		<div th:replace="${content}"> </div>
	
	</div>
    <!-- End of Content Area-->
     
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript" th:src="@{/js/script.js}"></script>
   
    
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
    function deleteContact(cid){
		swal({
			  title: "Are you sure?",
			  text: "You want to delete this contact...?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			  		window.location ="/user/delete/"+cid;
			    });
			  } else {
			    swal("Your Contact is safe !!");
			  }
			});
}
    </script>
    
  </body>
</html>