<?xml version="1.0"?>
<?xsl-stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"?>
	<xsl:template match = "/">
		<html>
			<body>
				<table>
					<tr>
						<th>patient name</th>
						<th>patient id</th>
						<th>patient age</th>
						<th>disease</th>
						<th>doctor name</th>
						<th>room number</th>
					</tr>
					<xsl:for-each select="hospital/patient">
						<tr>
							<td><xsl:value-of select = "patname"/></td>
							<td><xsl:value-of select = "patid"/></td>
							<td><xsl:value-of select="paage"/></td>
							<td><xsl:value-of select="disease"/></td>
							<td><xsl:value-of select="tdname"/></td>
							<td><xsl:value-of select="roomno"/></td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
<!-- </xsl-stylesheet> -->