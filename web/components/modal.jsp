<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/modal.css">
</head>

<body>
    <div id="modal" class="modal" style="display: <%= request.getAttribute("modalMessage") != null ? "block" : "none" %>;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p class="<%= request.getAttribute("modalType") != null ? request.getAttribute("modalType") + "-message" : "" %>">
                <%= request.getAttribute("modalMessage") != null ? request.getAttribute("modalMessage") : "" %>
            </p>
        </div>
    </div>

    <script>
        function closeModal() {
            document.getElementById('modal').style.display = 'none';
        }

    </script>
</body>

</html>
