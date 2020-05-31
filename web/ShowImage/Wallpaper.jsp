<%@ page import="cn.mintimate.entity.Public_Image" %>
<%@ page import="cn.mintimate.Service.FindImgService" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.mintimate.Service.impl.FindImgServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: mintimate
  Date: 2020/5/11
  Time: 7:10 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <link rel="stylesheet"  type="text/css" href="/resources/css/HideWebkit.css">
    <script type="text/javascript" src="/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/MyTool.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#next").click(function(){
                var pages = parseInt($("#pages").html());
                var page = parseInt($("#currentPage").html());
                if(page == pages){
                    return;
                }
                page++;
                location.href = "/image?type=壁纸&page="+page;
            })

            $("#previous").click(function () {
                var page = parseInt($("#currentPage").html());
                if(page == 1){
                    return;
                }
                page--;
                location.href = "/image?type=壁纸&page="+page;
            })

            $("#first").click(function () {
                location.href = "/image?type=壁纸&page=1";
            })

            $("#last").click(function(){
                var pages = parseInt($("#pages").html());
                location.href = "/image?type=壁纸&page="+pages;
            })
        })
    </script>
</head>
<body>
<style>
    .layui-table-cell{
        height:36px;
        line-height: 36px;
    }
    .layui-table img {
        height: 55px;
    }
</style>
<div style="padding: 15px; height: 100%">
    <table class="layui-table" lay-size="lg">
        <thead>
        <tr>
            <th>ID</th>
            <th>图片名称</th>
            <th>预览图</th>
            <th>加入时间</th>
            <th>下载&浏览</th>
            <th>下载</th>
            <th>图床</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="public_image">
            <tr style="height: 10%">
                <td height="100px">${public_image.id}</td>
                <td height="100px">${public_image.image_name}</td>
                <td height="100px"><img src="${public_image.path}" /></td>
                <td height="100px">${public_image.creation_date}</td>
                <td height="100px">${public_image.download_count}</td>
                <td height="100px"><a onclick="do_download()" href="/DownloadImage?filename=${public_image.image_name}&id=${public_image.id}">
                    <span style="color: #F44336">Here</span>
                </a></td>
                <td height="100px"><a onclick="do_view()" target="_blank" href="/image?method=view&id=${public_image.id}">
                    <span style="color: #FF6D00">Here</span></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tr>
            <td colspan="7" align="center">
                <span class="layui-btn-disabled layui-btn-xs" >每页<span id="dataPrePage">${dataPrePage}</span>条数据</span>
                <button id="first" class="layui-btn layui-btn-primary layui-btn-xs ">首页</button>
                <button id="last" class="layui-btn layui-btn-primary layui-btn-xs">尾页</button>
                <button class="layui-btn-disabled layui-btn-xs"><span id="currentPage">${currentPage }</span>/<span id="pages">${pages }</span></button>
                <button id="previous" class="layui-btn layui-btn-primary layui-btn-xs">上一页</button>
                <button id="next" class="layui-btn layui-btn-primary layui-btn-xs">下一页</button>
                <button class="layui-btn layui-btn-normal layui-btn-xs" href="#" onclick="do_flash()">刷新下载数</button>
            </td>
        </tr>
    </table>
</div>
</body>
</html>