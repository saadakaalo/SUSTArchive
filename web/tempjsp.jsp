

<!doctype html>
<html>
	<head>
		<title>Project Upload</title>
		<link rel="stylesheet"  href="style.css"/>
	</head>

	<body>
	
		<div class="mainview" align="center">

			<header>
				<h1>SUST ARCHIVE</h1>
			</header>

			<div class="mainbody">
				<div class="loginview">

					<form method="post" action="uploadServlet" enctype="multipart/form-data">
						<input type="hidden" value="test" name="methodName"/>
						<div class="loginfield">
							<ul>

								<li>
                                                                        <input type="text" name="regNo" placeHolder="Registration no"/>
								</li>

								<li>
									<input type="text" name="courseCode" placeHolder="Course code"/>
								</li>
                                                                
                                                                <li>
                                                                         <input type="file" name="projectFile" />
                                                                </li>

								<li>
									<input type="submit" value="save" />
								</li>
								
							</ul>
						</div>

					</form>
				</div>
            </div>

			<div class="footer">
                <p><a href="index.html">HOME</a></p>
                <p>Developed By: SUST_CSE</p>
            </div> 
            
		</div>

	</body>
</html>