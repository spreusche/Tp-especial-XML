<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/result">
	<html>
		<body>
			<table border="1">
				<tr>
					<th style="background-color:Grey;">Name</th>
					<th>Location</th>
					<th>Reputation</th>
					<th>UpVotes</th>
					<th>DownVotes</th>
					<th>TopPost</th>
				</tr>
				<xsl:for-each select="users/user">
						<tr style="background-color:Grey;">
							<td style="background-color:Grey;"><xsl:value-of select="name"/></td>
							<td style="background-color:LightGrey;"><xsl:value-of select="location"/></td>
							<td style="background-color:Grey;"><xsl:value-of select="reputation"/></td>
							<td style="background-color:LightGrey;"><xsl:value-of select="upVotes"/></td>
							<td style="background-color:Grey;"><xsl:value-of select="downVotes"/></td>
							<td style="background-color:LightGrey;"><xsl:value-of select="top_post"/></td>
						</tr>
				</xsl:for-each>
			</table>
		</body>
	</html>
</xsl:template>
</xsl:stylesheet>