<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Currency Converter</title>
</head>
<body>

<h2>Currency Converter</h2>


<form method="POST" action="${contextPath}/calculate">
    <table>
        <tr>
            <td><label for="inputValue">Input currency value:</label></td>
            <td><input type="number" name="inputValue" step="0.01" required value="${inputValue}" style=width: 200px></td>

            <td>
                <select name="inputCurrency" required style="width: 200px; text-align: center;">
                    <option value="">---Choose input currency---</option>
                    <option value="PLN" ${inputCurrency == 'PLN' ? 'selected' : ''}>PLN</option>
                    <option value="EUR" ${inputCurrency == 'EUR' ? 'selected' : ''}>EUR</option>
                    <option value="DOL" ${inputCurrency == 'DOL' ? 'selected' : ''}>DOL</option>
                </select>
            </td>
        </tr>

        <tr>
            <td><label for="outputValue">Output currency value:</label></td>
            <td><input type="text" id="outputValue" name="outputValue" readonly value="${outputValue}">
            </td>

            <td>
                <select name="outputCurrency" required style="width: 200px; text-align: center;">
                    <option value="">---Choose output currency---</option>
                    <option value="PLN" ${outputCurrency == 'PLN' ? 'selected' : ''}>PLN</option>
                    <option value="EUR" ${outputCurrency == 'EUR' ? 'selected' : ''}>EUR</option>
                    <option value="DOL" ${outputCurrency == 'DOL' ? 'selected' : ''}>DOL</option>
                </select>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <button type="submit">Calculate</button>
            </td>
</form>


<form method="POST" action="${contextPath}/clearFields">
            <td>
                <button type="submit">Clear Fields</button>
            </td>
</form>


    </table>

</body>
</html>