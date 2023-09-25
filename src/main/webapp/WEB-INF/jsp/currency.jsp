<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<html>
<body>

<h2>Currency converter</h2>

<form:form method="POST" action="${contextPath}/calculate">
    <table>
        <tr>
            <td><label for="inputValue">Input currency value:</label></td>
            <td><input type="number" name="inputValue" step="0.01" required value="${inputValue}"></td>
            <td>
                <label for="inputCurrency">Choose input currency:</label>
                <select name="inputCurrency" required>
                            <option value="">---Choose input currency---</option>
                            <option value="PLN" ${inputCurrency == 'PLN' ? 'selected' : ''}>PLN</option>
                            <option value="EUR" ${inputCurrency == 'EUR' ? 'selected' : ''}>EUR</option>
                            <option value="DOL" ${inputCurrency == 'DOL' ? 'selected' : ''}>DOL</option>
                        </select>
            </td>
        </tr>

        <tr>
            <td><label for="outputValue">Output currency value</label></td>
            <td><input type="text" id="outputValue" name="outputValue" readonly value="${outputValue}">
            </td>
            <td>
                <label for="outputCurrency">Choose output currency:</label>
                        <select name="outputCurrency" required>
                            <option value="">---Choose output currency---</option>
                            <option value="PLN" ${outputCurrency == 'PLN' ? 'selected' : ''}>PLN</option>
                            <option value="EUR" ${outputCurrency == 'EUR' ? 'selected' : ''}>EUR</option>
                            <option value="DOL" ${outputCurrency == 'DOL' ? 'selected' : ''}>DOL</option>
                        </select>
            </td>
        </tr>

                <input type="hidden" name="inputCurrency" value="${inputCurrency}">
                <input type="hidden" name="outputCurrency" value="${outputCurrency}">

        <tr>
            <td>
                <button type="submit">CALCULATE</button>
            </td>

    </table>
</form:form>

<td>
        <form action="${contextPath}/clearFields" method="POST">
            <button type="submit">Clear Fields</button>
        </form>
    </td>


</body>
</html>

