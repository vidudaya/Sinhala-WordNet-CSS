<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert New Synset</title>
<link rel="stylesheet" type="text/css" href="theme/css/style.css">
<script type="text/javascript" src="theme/js/add_new_div.js"></script>
<script type="text/javascript" src="theme/js/expand_collapse.js"></script>
<script type="text/javascript">
var counter = ${synset.getWords().size()};
</script>
</head>
<body>
<div id="wrap">
		<div id="new_sysnset">
			<form:form method="POST" modelAttribute="synset" action="InsetNewSynset">
				<div id="add_words" class="insert_words">
					<div class="section_header">
						<h2>පද සම්බන්ධතා</h2>
					</div>
					<div id="words_div">
						<c:forEach items="${synset.getWords()}" varStatus="loop">
							<div id="word_${loop.index+1}" class="word_set">
								<span id="ex_span_${loop.index+1}"
									onclick="ExpandCollapse(this.id);">
								<c:choose>
									<c:when test="${synset.getWords().size()-1 == loop.index}">
									<img
                                    src="theme/images/collapse.png" /></span> <span
                                    id="show_span_${loop.index+1}" class="show_span">සඟවන්න</span>
										<div id="ex_div_${loop.index+1}" style="display: block;">
									</c:when>
									<c:otherwise>
									<img
                                    src="theme/images/expand.png" /></span> <span
                                    id="show_span_${loop.index+1}" class="show_span">පෙන්වන්න</span>
										<div id="ex_div_${loop.index+1}" style="display: none;">
									</c:otherwise>
								</c:choose>
								<table class="word_table">
									<tbody>
										<tr>
											<td><label>සිංහල පදය</label></td>
											<td><form:input path="words[${loop.index}].lemma" type="text" maxlength="255"
													size="22" /></td>
										</tr>
										<tr>
											<td><label>ප්‍රකෘතිය</label></td>
											<td><form:input path="words[${loop.index}].root.lemma" type="text" maxlength="255" size="22"/></td>
										</tr>
										<tr>
											<td><label>මූල භාෂාව</label></td>
											<td><form:select path="words[${loop.index}].origin.lemma">
													<form:option value="නොදනී">නොදනී</form:option>
													<form:option value="හින්දි">හින්දි</form:option>
													<form:option value="දෙමළ">දෙමළ</form:option>
													<form:option value="ඉංග්‍රීසි">ඉංග්‍රීසි</form:option>
													<form:option value="පෘතුග්‍රීසි">පෘතුග්‍රීසි</form:option>
													<form:option value="ලංදේසි">ලංදේසි</form:option>
											</form:select></td>
										</tr>
										<tr>
											<td><label>මූල භාෂා වර්ගය</label></td>
											<td>
											<form:radiobutton path="words[${loop.index}].derivationType.lemma" value="තත්සම"/>තත්සම<br>
											<form:radiobutton path="words[${loop.index}].derivationType.lemma" value="තත්භව"/>තත්භව<br>
										</tr>
										<tr>
											<td><label>භාවිතය</label></td>
											<td>
											<form:radiobutton path="words[${loop.index}].usage.lemma" value="වාචික"/>වාචික<br>
                                            <form:radiobutton path="words[${loop.index}].usage.lemma" value="ලිඛිත"/>ලිඛිත<br>
										</tr>
										<tr>
											<td><label>විරුද්ධ පදය</label></td>
											<%-- <td><form:input path="words[${loop.index}].antonym.lemma" type="text" maxlength="255" size="22"/></td> --%>
											
										</tr>
									</tbody>
								</table>
							</div>
					</div>
					</c:forEach>
				</div>
				<div class="button_div">
					<input type="button" value="නව පදයක් යෙදීම" id="btn_add_word"
						class="button" onclick="copyDiv()" />
				</div>

				<div class="section_header">
					<h2>පද කුලකයේ සම්බන්ධතා</h2>
				</div>
				<div class="word_set">
					<table class="word_table">
						<tbody>
							<tr>
<%--                                 <td><form:hidden path="offset"/></td> --%>
                            </tr>
							<tr>
								<%-- <td><label>සිංහල අර්ථය :</label></td>
								<td><form:textarea path="definition" rows="5" cols="30" /></td> --%>
							</tr>
							<tr>
								<%-- <td><label>සිංහල උදාහරණ :</label></td>
								<td><form:textarea path="example" rows="5" cols="30" /></td> --%>
							</tr>
							<tr>
								<%-- <td><label>ලිංග භේදය</label></td>
								<td><form:radiobutton path="gender" value="පුරුෂ" />පුරුෂ<br>
									<form:radiobutton path="gender" value="ස්ත්‍රී" />ස්ත්‍රී<br>
									<form:radiobutton path="gender" value="නොසලකා හරින්න" />නොසලකා හරින්න
								</td> --%>
							</tr>
							<tr>
								<!-- <td><label>Hypernyms</label></td>
								<td><input type="text" maxlength="255" size="20"
									name="hypernyms" /></td> -->
							</tr>
							<tr>
								<!-- <td><label>Hyponyms</label></td>
								<td><input type="text" maxlength="255" size="20"
									name="hyponyms" /></td> -->
							</tr>
							<!-- <tr>
								<td colspan="2">
									<div class="sub_div">
										<div class="sub_div_header">
											<label>Meronyms</label>
										</div>
										<table>
											<tbody>
												<tr>
													<td><label>Made of</label></td>
													<td><input type="text" maxlength="255" size="21"
														name="mero_made" /></td>
												</tr>
												<tr>
													<td><label>Component of</label></td>
													<td><input type="text" maxlength="255" size="21"
														name="mero_comp" /></td>
												</tr>
												<tr>
													<td><label>Member of</label></td>
													<td><input type="text" maxlength="255" size="21"
														name="mero_memb" /></td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>

							</tr>
							<tr> -->
							<!-- 	<td colspan="2">
									<div class="sub_div">
										<div class="sub_div_header">
											<label>Holonyms</label>
										</div>
										<table>
											<tbody>
												<tr>
													<td><label>Made of</label></td>
													<td><input type="text" maxlength="255" size="21"
														name="holo_made" /></td>
												</tr>
												<tr>
													<td><label>Component of</label></td>
													<td><input type="text" maxlength="255" size="21"
														name="holo_comp" /></td>
												</tr>
												<tr>
													<td><label>Member of</label></td>
													<td><input type="text" maxlength="255" size="21"
														name="holo_memb" /></td>
												</tr>
											</tbody>
										</table>
									</div>
								</td> -->
							</tr>
						</tbody>
					</table>
				</div>
				<div class="button_div">
					<input type="submit" value="යොමන්න" id="btn_add_synset"
						class="button" style="float: right" />
				</div>
		</div>
		</form:form>

	</div>
	<div class="footer">
		<div class="links">
			<p class="lintitle1">
				© සියලුම හිමිකම් ඇවිරිණි. <a href="http://www.uom.lk/" target="_new"
					class="cse">සිංහල Wordnet ව්‍යාපෘතිය.</a>
			</p>
		</div>
	</div>
	</div>
</body>
</html>