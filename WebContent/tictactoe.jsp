<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:useBean id="theGame" class="Game.Game" scope="session" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Tic Tac Toe</title>
<style>
.button {
	color: maroon;
}

.radio {
	display: inline-block;
	text-align: center;
	font-size: 5%;
}

.container {
	margin-top: 5%;
	height: 5%;
	margin-bottom: 5%;
}

.title {
	margin-bottom: 3%;
	font-size: 30px;
}

input[type=radio] {
	height: 35px;
	width: 35px;
	margin-left: 40%;
	margin-bottom: 30%;
	margin-top: 30%;
}

.table {
	height: 5%;
}

p {
	display: inline-block;
	margin-left: 38%;
	margin-bottom: 3%;
	margin-top: 30%;
}
</style>
</head>
<body>

	<div class="container">
		<div class="btn btn-warning btn-lg-outline-success btn-block title">
			<a
				href="https://www.thesprucecrafts.com/tic-tac-toe-game-rules-412170"
				target="_blank">Learn to play Tic Tac Toe</a>
		</div>
		<form method="post" action="tictactoe.jsp">

			<%
				if (request.getParameter("reset") != null) {
				theGame.reset();
			}
			%>
			<%
				if (theGame.checkWin() == 1) {
			%>
			<div class="btn btn-sucess btn-lg btn-block">Congrats, You have
				won!</div>
			<%
				} else if (theGame.checkWin() == -1) {
			%>
			<div class="btn btn-danger btn-lg btn-block">Computer has won!</div>
			<%
				} else {
			%>

			<%
				if (request.getParameter("board") != null) {
			%>
			<%
				String move = request.getParameter("board");
			%>

			You moved
			<%=move%>

			<%
				int r = Integer.parseInt(move.substring(0, 1));
			%>
			<%
				int c = Integer.parseInt(move.substring(1, 2));
			%>



			<%
				theGame.set(r, c, 1);
			%>

			<%
				if (theGame.isFull() != true) {
				String compMove = theGame.computerMove();
			%>
			Computer move:
			<%=compMove%>
			<%
				}
			%>

			<%
				}
			}
			%>



			<table class="table table-sm table1" border=20px>
				<%
					for (int r = 0; r < 3; r++) {
				%>
				<tr>
					<%
						for (int c = 0; c < 3; c++) {
					%>
					<td>
						<%
							if (theGame.get(r, c) == 1) {
						%>
						<p>X</p> <%
 	} else if (theGame.get(r, c) == -1) {
 %>
						<p>O</p> <%
 	} else {
 %> <input class="radio" type="radio" name="board"
						value="<%=r%><%=c%>" /> <%
 	}
 %>
					</td>
					<%
						}
					%>
				</tr>
				<%
					}
				%>

			</table>

			<br>

			<%
				if (theGame.checkWin() == 1) {
			%>
			<div class="btn btn-sucess btn-lg btn-block">Congrats, You have
				won!</div>
			<%
				} else if (theGame.checkWin() == -1) {
			%>
			<div class="btn btn-danger btn-lg btn-block">Computer has won!</div>
			<%
				}
			%>


			<%
				if (theGame.checkWin() == 0 && theGame.isFull() != true) {
			%>
			<button type="submit" class="btn btn-primary btn-lg btn-block">Make
				this move!</button>
			<%
				} else if (theGame.isFull() == true) {
			%>
			<div class="btn btn-warning btn-lg btn-block">Game Draw!</div>
			<!--  <input type="submit" name="reset" value="Play Again!" />-->
			<button type="submit" name="reset"
				class="btn btn-primary btn-lg btn-block">Play Again!</button>
			<%
				} else {
			%>
			<!-- <input type="submit" name="reset" value="Play Again!" /> -->
			<button type="submit" name="reset"
				class="btn btn-primary btn-lg btn-block">Play Again!</button>
			<%
				}
			%>
		</form>

	</div>
</body>
</html>