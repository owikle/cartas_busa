<?xml version="1.0" encoding="UTF-8"?>
            <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xpath-default-namespace="http://www.tei-c.org/ns/1.0"
                exclude-result-prefixes="xs"
                version="2.0"
                xmlns="http://www.w3.org/1999/xhtml">
                
                <xsl:template match="/">
                    <xsl:variable name="doc_id" select="//title/@xml:id"/> 
                    <!-- Recuperamos el id del documento en una variable para nombrar el archivo de salida -->
                    <!-- Redirigir el resultado hacia un archivo -->        
                    <xsl:result-document method="html" encoding="utf-8"
                        href="objects/transcripciones/{$doc_id}.html" omit-xml-declaration="yes">---
        layout: default
        title: <xsl:apply-templates select="$doc_id"/>
       ---
       <div>
<p class="fecha"><xsl:apply-templates select="//dateline"/></p>


<xsl:apply-templates select="//div"/>

</div>


        </xsl:result-document>
        <!-- Redirigir el resultado hacia un archivo -->
    </xsl:template>


    <!-- Transformaciones -->


<xsl:template match="//p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="//salute">
        <p class="saludo">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

        <xsl:template match="//opener">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

            <xsl:template match="//signatures">
        <p class="firma">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

            <xsl:template match="//postscript">
        <p class="posdata">
            <xsl:apply-templates/>
        </p>
    </xsl:template>



    <xsl:template match="//orgName">
        <span> 
            <xsl:attribute name="style">font-weight: bold;</xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>   
 

    <xsl:template match="//placeName">
    <a>
        <xsl:attribute name="class">pop-annotation</xsl:attribute>
        <xsl:attribute name="tabindex">0</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@key"/></xsl:attribute>
        <xsl:apply-templates/>
        </a>
    </xsl:template>   
    
    
    <xsl:template match="//persName">
    <a>
        <xsl:attribute name="class">pop-annotation</xsl:attribute>
        <xsl:attribute name="tabindex">0</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@key"/></xsl:attribute>
        <xsl:apply-templates/>
        </a>
    </xsl:template>  

    

      
    <xsl:template match="//note">
    <a>
        <xsl:attribute name="class">pop-annotation</xsl:attribute>
        <xsl:attribute name="tabindex">0</xsl:attribute>
        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
        <xsl:apply-templates/>
        </a>
    </xsl:template>   
    
    <xsl:template match="//corr">
        <span> 
            <xsl:attribute name="style">font-style: italic;</xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

<xsl:template match="//lb">
        <br/>
    </xsl:template>   

        <xsl:template match="//expan">[<xsl:apply-templates/>]</xsl:template>

</xsl:stylesheet>