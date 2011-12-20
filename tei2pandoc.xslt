<xsl:stylesheet version = '1.0'
     xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>


<xsl:template match="head">
# <xsl:value-of select="."/>
    <xsl:text xml:space='preserve'>
    </xsl:text>
</xsl:template>

<xsl:template match="argument">
    <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="hi">
    <xsl:choose>
        <xsl:when test='@rend="antiqua"'>
            *<xsl:value-of select="."/>*
        </xsl:when>
    </xsl:choose>
    <xsl:choose>
        <xsl:when test='@rend="gesperrt"'>
            **<xsl:value-of select="."/>**
        </xsl:when>
    </xsl:choose>
</xsl:template>

<xsl:template match="note">^[<xsl:value-of select="."/>]
</xsl:template>

<xsl:template match="text()">
    <xsl:value-of select="."/><xsl:text xml:space='preserve'>
</xsl:text>
</xsl:template>

<xsl:template match="@*|*|processing-instruction()|comment()" mode="recursive-copy">
  <xsl:copy>
    <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()" mode="recursive-copy"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>

