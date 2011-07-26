<!--

This stylesheet allows the SPARQL XML Results format to be transformed into a simple JSON
file

XSLT PARAMETERS

None

 -->
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:sparql="http://www.w3.org/2005/sparql-results#" 
	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
	xmlns:kml="http://www.opengis.net/kml/2.2" 
	xmlns="http://www.opengis.net/kml/2.2" 
	version="1.0" 
	exclude-result-prefixes="sparql rdf">

  <xsl:output 
  	method="text" 
  	omit-xml-declaration="yes"/>
  <xsl:strip-space 
  	elements="sparql:binding sparql:literal sparql:uri" />
    
	<xsl:template match="sparql:sparql">{ 
  "results": [
    <xsl:for-each select="sparql:results/sparql:result">
     {
         <xsl:for-each select="sparql:binding">
         	"<xsl:value-of select="@name"/>" : "<xsl:value-of select="."/>"
      	    <xsl:if test="position()!=last()">,</xsl:if><xsl:if test="position()=last()"><xsl:text>&#10;</xsl:text></xsl:if>         	
         </xsl:for-each>
     }
      <xsl:if test="position()!=last()">,</xsl:if><xsl:if test="position()=last()"><xsl:text>&#10;</xsl:text></xsl:if> 
    </xsl:for-each>      
  ]
}	
	</xsl:template>

</xsl:stylesheet>