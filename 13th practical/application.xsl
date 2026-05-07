<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:template match="/">

<html>

<head>

    <title>Student Result Dashboard</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            font-family:'Poppins', sans-serif;
            min-height:100vh;
            background:linear-gradient(135deg, #141e30, #243b55, #4b0082);
            background-size:300% 300%;
            animation:bgAnimation 10s ease infinite;
            display:flex;
            justify-content:center;
            align-items:center;
            padding:30px;
        }

        @keyframes bgAnimation{
            0%{background-position:0% 50%;}
            50%{background-position:100% 50%;}
            100%{background-position:0% 50%;}
        }

        .container{
            width:100%;
            max-width:1200px;
            background:rgba(255,255,255,0.12);
            backdrop-filter:blur(18px);
            border-radius:30px;
            padding:40px;
            box-shadow:0 15px 40px rgba(0,0,0,0.35);
            border:1px solid rgba(255,255,255,0.15);
        }

        h2{
            text-align:center;
            color:white;
            font-size:45px;
            margin-bottom:35px;
            letter-spacing:1px;
        }

        .student-info{
            text-align:center;
            color:white;
            margin-bottom:25px;
            line-height:1.8;
            font-size:18px;
        }

        table{
            width:100%;
            border-collapse:collapse;
            overflow:hidden;
            border-radius:20px;
            background:white;
            box-shadow:0 10px 25px rgba(0,0,0,0.2);
        }

        th{
            background:linear-gradient(135deg, #ff0080, #7928ca);
            color:white;
            padding:18px;
            font-size:18px;
            text-transform:uppercase;
            letter-spacing:1px;
        }

        td{
            padding:18px;
            text-align:center;
            font-size:16px;
            color:#333;
            border-bottom:1px solid #eee;
        }

        tr:nth-child(even){
            background:#f8f9ff;
        }

        tr:hover{
            background:#eef2ff;
            transition:0.3s;
        }

        .pass{
            background:#22c55e;
            color:white;
            padding:8px 16px;
            border-radius:20px;
            font-size:14px;
            font-weight:600;
        }

        .fail{
            background:#ef4444;
            color:white;
            padding:8px 16px;
            border-radius:20px;
            font-size:14px;
            font-weight:600;
        }

        .high{
            color:#16a34a;
            font-weight:bold;
        }

        .medium{
            color:#ca8a04;
            font-weight:bold;
        }

        .low{
            color:#dc2626;
            font-weight:bold;
        }

        .footer{
            margin-top:25px;
            text-align:center;
            color:white;
            font-size:15px;
            opacity:0.9;
        }

        @media(max-width:768px){

            .container{
                padding:25px;
            }

            h2{
                font-size:32px;
            }

            th, td{
                padding:12px;
                font-size:14px;
            }
        }

    </style>

</head>

<body>

    <div class="container">

        <div class="student-info">
            <h3>Name: Mitali Pawar</h3>
            <h3>Roll No: 29</h3>
            <h3>Branch: CSE(A)</h3>
        </div>

        <h2>Student Result Dashboard</h2>

        <table>

            <tr>
                <th>Name</th>
                <th>Roll No</th>
                <th>Marks</th>
                <th>Result</th>
            </tr>

            <xsl:for-each select="students/student">

            <tr>

                <td>
                    <xsl:value-of select="name"/>
                </td>

                <td>
                    <xsl:value-of select="rollno"/>
                </td>

                <td>

                    <xsl:choose>

                        <xsl:when test="marks &gt;= 80">
                            <span class="high">
                                <xsl:value-of select="marks"/>
                            </span>
                        </xsl:when>

                        <xsl:when test="marks &gt;= 50">
                            <span class="medium">
                                <xsl:value-of select="marks"/>
                            </span>
                        </xsl:when>

                        <xsl:otherwise>
                            <span class="low">
                                <xsl:value-of select="marks"/>
                            </span>
                        </xsl:otherwise>

                    </xsl:choose>

                </td>

                <td>

                    <xsl:choose>

                        <xsl:when test="marks &gt;= 50">
                            <span class="pass">
                                PASS
                            </span>
                        </xsl:when>

                        <xsl:otherwise>
                            <span class="fail">
                                FAIL
                            </span>
                        </xsl:otherwise>

                    </xsl:choose>

                </td>

            </tr>

            </xsl:for-each>

        </table>

        <div class="footer">
            XML + XSL Based Student Result Analysis System
        </div>

    </div>

</body>

</html>

</xsl:template>

</xsl:stylesheet>