<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
	<xsl:template match="/">
		<xsl:apply-templates select="/Include"/>
		<xsl:apply-templates select="/Container"/>
	</xsl:template>
	<xsl:template match="/Include">
		<xsl:for-each select="/Include">
			<xsl:for-each select="Container">
				<xsl:element name="div">
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="@type = 'outlined'">container-outlined</xsl:when>
							<xsl:when test="@type = 'filled'">container-filled</xsl:when>
							<xsl:otherwise>container</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:if test="@id != ''">
						<xsl:attribute name="id">
							<xsl:value-of select="@id"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:attribute name="style">
						<xsl:if test="@color != ''">background: <xsl:value-of select="@color"/>;</xsl:if>
						<xsl:if test="@gap != ''">gap: <xsl:value-of select="@gap"/>;</xsl:if>
						<xsl:if test="@padding != ''">padding: <xsl:value-of select="@padding"/>;</xsl:if>
						<xsl:if test="@margin != ''">margin: <xsl:value-of select="@margin"/>;</xsl:if>
						<xsl:if test="@text-color != ''">color: <xsl:value-of select="@text-color"/>;</xsl:if>
						<xsl:if test="@border-radius != ''">border-radius: <xsl:value-of select="@border-radius"/>;</xsl:if>
						<xsl:choose>
							<xsl:when test="@width = 'match-parent'">width: 100%;</xsl:when>
							<xsl:when test="@width = 'fit-content'">width: fit-content;</xsl:when>
							<xsl:when test="@width = 'auto'">width: 100%;</xsl:when>
							<xsl:otherwise>width: <xsl:value-of select="@width"/>;</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="@height = 'match-parent'">height: 100%;</xsl:when>
							<xsl:when test="@height = 'fit-content'">height: fit-content;</xsl:when>
							<xsl:when test="@height = 'auto'">height: 100%;</xsl:when>
							<xsl:otherwise>height: <xsl:value-of select="@height"/>;</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="@orientation = 'horizontal'">display: flex; flex-direction: row;</xsl:when>
							<xsl:otherwise>display: flex; flex-direction: column;</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>


					<xsl:for-each select="*">
						<xsl:choose>

							<!-- Top-App-Bar -->

							<xsl:when test="name() = 'Top-App-Bar'">
								<xsl:element name="div">
									<xsl:attribute name="class">Top-App-Bar</xsl:attribute>
									<xsl:element name="div">
										<xsl:attribute name="class">Icon-Container</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">material-symbols-rounded-30</xsl:attribute>
											<xsl:value-of select="@forward-icon"/>
										</xsl:element>
									</xsl:element>
									<xsl:element name="div">
										<xsl:attribute name="class">Top-App-Bar-Title</xsl:attribute>
										<xsl:value-of select="@title"/>
									</xsl:element>
									<xsl:element name="div">
										<xsl:attribute name="class">Icon-Container</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">material-symbols-rounded-30</xsl:attribute>
											<xsl:value-of select="@tailing-icon"/>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:when>

							<!-- Clickable -->

							<xsl:when test="name() = 'Clickable'">
								<xsl:element name="div">
									<xsl:attribute name="class">
										<xsl:choose>
											<xsl:when test="@type = 'text'">clickable-text</xsl:when>
											<xsl:when test="@type = 'outlined'">clickable-outlined</xsl:when>
											<xsl:otherwise>clickable</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:if test="@id != ''">
										<xsl:attribute name="id">
											<xsl:value-of select="@id"/>
										</xsl:attribute>
									</xsl:if>
									<xsl:if test="@action-type != ''">
										<xsl:attribute name="action-type">
											<xsl:value-of select="@action-type"/>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="@action-type = 'alert dialog'">
												<xsl:for-each select="Alert-Dialog">
													<xsl:attribute name="Alert-Dialog-Title">
														<xsl:value-of select="@title"/>
													</xsl:attribute>
													<xsl:attribute name="Alert-Dialog-Description">
														<xsl:value-of select="@description"/>
													</xsl:attribute>
													<xsl:attribute name="Alert-Dialog-Button-List">
														<xsl:value-of select="@button-list"/>
													</xsl:attribute>
												</xsl:for-each>
											</xsl:when>
											<xsl:when test="@action-type = 'state change'">
												<xsl:for-each select="State-Change">
													<xsl:attribute name="for-id">
														<xsl:value-of select="@for-id" />
													</xsl:attribute>
													<xsl:attribute name="property-list">
														<xsl:value-of select="@property-list" />
													</xsl:attribute>
													<xsl:attribute name="value-list">
														<xsl:value-of select="@value-list" />
													</xsl:attribute>
												</xsl:for-each>
											</xsl:when>
											<xsl:when test="@action-type = 'change page'">
												<xsl:for-each select="Change-Page">
													<xsl:if test="@to != ''">
														<xsl:attribute name="change-to">
															<xsl:value-of select="@to"/>
														</xsl:attribute>
													</xsl:if>
												</xsl:for-each>
											</xsl:when>
										</xsl:choose>
									</xsl:if>
									<xsl:attribute name="style">
										<xsl:if test="@color != ''">
											background: <xsl:value-of select="@color"/>;
										</xsl:if>
										<xsl:if test="@text-color != ''">
											color: <xsl:value-of select="@text-color"/>;
										</xsl:if>
										<xsl:choose>
											<xsl:when test="@width = 'match-parent'">width: 100%;</xsl:when>
											<xsl:when test="@width = 'fit-content'">width: fit-content;</xsl:when>
											<xsl:when test="@width = 'auto'">width: 100%;</xsl:when>
											<xsl:otherwise>width: <xsl:value-of select="@width"/>;</xsl:otherwise>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="@height = 'match-parent'">height: 100%;</xsl:when>
											<xsl:when test="@height = 'fit-content'">height: fit-content;</xsl:when>
											<xsl:when test="@height = 'auto'">height: 100%;</xsl:when>
											<xsl:otherwise>height: <xsl:value-of select="@height"/>;</xsl:otherwise>
										</xsl:choose>
									</xsl:attribute>
									<xsl:if test="@icon != ''">
										<xsl:element name="div">
											<xsl:attribute name="class">material-symbols-rounded-<xsl:value-of select="@icon-size" /></xsl:attribute>
											<xsl:value-of select="@icon"/>
										</xsl:element>
									</xsl:if>
									<xsl:if test="@text != ''">
										<xsl:choose>
											<xsl:when test="@icon != ''">
												<div style="margin-right: 0.75em;">
													<xsl:value-of select="@text"/>
												</div>
											</xsl:when>
											<xsl:otherwise>
												<div style="margin: 1em;">
													<xsl:value-of select="@text"/>
												</div>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:element>
							</xsl:when>

							<!-- Include -->

							<xsl:when test="name() = 'Include'">
								include-<xsl:value-of select="@name"/>
							</xsl:when>

							<!-- Radio Button -->

							<xsl:when test="name() = 'Radio-Button'">
								<xsl:element name="div">
									<xsl:attribute name="class">Radio-Button</xsl:attribute>
									<xsl:element name="input">
										<xsl:attribute name="type">radio</xsl:attribute>
										<xsl:attribute name="name">
											<xsl:value-of select="@group"/>
										</xsl:attribute>
										<xsl:attribute name="id">radio<xsl:number value="position()" format="1"/></xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="@value"/>
										</xsl:attribute>
										<xsl:if test="@pressed != ''">
											<xsl:if test="@pressed = 'yes'">
												<xsl:attribute name="checked"/>
											</xsl:if>
										</xsl:if>
									</xsl:element>
									<xsl:element name="label">
										<xsl:attribute name="for">radio<xsl:number value="position()" format="1"/></xsl:attribute>
										<xsl:attribute name="class">Radio-Label</xsl:attribute>
										<xsl:element name="div">
											<xsl:attribute name="class">Radio-Hover-Indicator</xsl:attribute>
											<xsl:element name="div">
												<xsl:attribute name="class">Radio-Indicator-Outer</xsl:attribute>
												<xsl:element name="div">
													<xsl:attribute name="class">Radio-Indicator-Inner</xsl:attribute>
												</xsl:element>
											</xsl:element>
										</xsl:element>
										<xsl:element name="div">
											<xsl:value-of select="@text"/>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:when>

							<!-- Switch -->

							<xsl:when test="name() = 'Switch'">
								<xsl:element name="div">
									<xsl:attribute name="class">Switch</xsl:attribute>
									<xsl:element name="input">
										<xsl:attribute name="type">checkbox</xsl:attribute>
										<xsl:attribute name="name">
											<xsl:value-of select="@group"/>
										</xsl:attribute>
										<xsl:attribute name="id">switch<xsl:number value="position()" format="1"/></xsl:attribute>
										<xsl:attribute name="value">
											<xsl:value-of select="@value"/>
										</xsl:attribute>
										<xsl:if test="@pressed != ''">
											<xsl:if test="@pressed = 'yes'">
												<xsl:attribute name="checked"/>
											</xsl:if>
										</xsl:if>
									</xsl:element>
									<xsl:element name="label">
										<xsl:attribute name="for">switch<xsl:number value="position()" format="1"/></xsl:attribute>
										<xsl:attribute name="class">Switch-Label</xsl:attribute>
										<xsl:element name="div">
											<xsl:value-of select="@text"/>
										</xsl:element>
										<xsl:element name="div">
											<xsl:attribute name="class">Switch-Main</xsl:attribute>
											<xsl:element name="div">
												<xsl:attribute name="class">Switch-Inner</xsl:attribute>
											</xsl:element>
										</xsl:element>
									</xsl:element>
								</xsl:element>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</xsl:element>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="/Container">
		<xsl:for-each select="/*">
			<xsl:choose>
				<xsl:when test="name() = 'Container'">
					<html>
						<head>
							<link rel="stylesheet" href="../Main/style.css"/>
							<title><xsl:value-of select="@name"/></title>
						</head>
						<body>
							<xsl:element name="div">
								<xsl:attribute name="class">
									<xsl:choose>
										<xsl:when test="@type = 'outlined'">container-outlined</xsl:when>
										<xsl:when test="@type = 'filled'">container-filled</xsl:when>
										<xsl:otherwise>container</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
								<xsl:if test="@id != ''">
									<xsl:attribute name="id">
										<xsl:value-of select="@id"/>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="style">
									<xsl:if test="@color != ''">background: <xsl:value-of select="@color"/>;</xsl:if>
									<xsl:if test="@gap != ''">gap: <xsl:value-of select="@gap"/>;</xsl:if>
									<xsl:if test="@padding != ''">padding: <xsl:value-of select="@padding"/>;</xsl:if>
									<xsl:if test="@margin != ''">margin: <xsl:value-of select="@margin"/>;</xsl:if>
									<xsl:if test="@text-color != ''">color: <xsl:value-of select="@text-color"/>;</xsl:if>
									<xsl:if test="@border-radius != ''">border-radius: <xsl:value-of select="@border-radius"/>;</xsl:if>
									<xsl:choose>
										<xsl:when test="@width = 'match-parent'">width: 100%;</xsl:when>
										<xsl:when test="@width = 'fit-content'">width: fit-content;</xsl:when>
										<xsl:when test="@width = 'auto'">width: 100%;</xsl:when>
										<xsl:otherwise>width: <xsl:value-of select="@width"/>;</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="@height = 'match-parent'">height: 100%;</xsl:when>
										<xsl:when test="@height = 'fit-content'">height: fit-content;</xsl:when>
										<xsl:when test="@height = 'auto'">height: 100%;</xsl:when>
										<xsl:otherwise>height: <xsl:value-of select="@height"/>;</xsl:otherwise>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="@orientation = 'horizontal'">orientation: landscape;</xsl:when>
										<xsl:otherwise>orientation: portrait;</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>

								<xsl:for-each select="*">
									<xsl:choose>

										<!-- Clickable -->

										<xsl:when test="name() = 'Clickable'">
											<xsl:element name="div">
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="@type = 'text'">clickable-text</xsl:when>
														<xsl:when test="@type = 'outlined'">clickable-outlined</xsl:when>
														<xsl:otherwise>clickable</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:if test="@id != ''">
													<xsl:attribute name="id">
														<xsl:value-of select="@id"/>
													</xsl:attribute>
												</xsl:if>
												<xsl:if test="@action-type != ''">
													<xsl:attribute name="action-type">
														<xsl:value-of select="@action-type"/>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="@action-type = 'alert dialog'">
															<xsl:for-each select="Alert-Dialog">
																<xsl:attribute name="Alert-Dialog-Title">
																	<xsl:value-of select="@title"/>
																</xsl:attribute>
																<xsl:attribute name="Alert-Dialog-Description">
																	<xsl:value-of select="@description"/>
																</xsl:attribute>
																<xsl:attribute name="Alert-Dialog-Button-List">
																	<xsl:value-of select="@button-list"/>
																</xsl:attribute>
															</xsl:for-each>
														</xsl:when>
														<xsl:when test="@action-type = 'state change'">
															<xsl:for-each select="State-Change">
																<xsl:attribute name="for-id">
																	<xsl:value-of select="@for-id" />
																</xsl:attribute>
																<xsl:attribute name="property-list">
																	<xsl:value-of select="@property-list" />
																</xsl:attribute>
																<xsl:attribute name="value-list">
																	<xsl:value-of select="@value-list" />
																</xsl:attribute>
															</xsl:for-each>
														</xsl:when>
														<xsl:when test="@action-type = 'change page'">
															<xsl:for-each select="Change-Page">
																<xsl:if test="@to != ''">
																	<xsl:attribute name="change-to">
																		<xsl:value-of select="@to"/>
																	</xsl:attribute>
																</xsl:if>
															</xsl:for-each>
														</xsl:when>
													</xsl:choose>
												</xsl:if>
												<xsl:attribute name="style">
													<xsl:if test="@color != ''">
														background: <xsl:value-of select="@color"/>;
													</xsl:if>
													<xsl:if test="@text-color != ''">
														color: <xsl:value-of select="@text-color"/>;
													</xsl:if>
													<xsl:choose>
														<xsl:when test="@width = 'match-parent'">width: 100%;</xsl:when>
														<xsl:when test="@width = 'fit-content'">width: fit-content;</xsl:when>
														<xsl:when test="@width = 'auto'">width: 100%;</xsl:when>
														<xsl:otherwise>width: <xsl:value-of select="@width"/>;</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="@height = 'match-parent'">height: 100%;</xsl:when>
														<xsl:when test="@height = 'fit-content'">height: fit-content;</xsl:when>
														<xsl:when test="@height = 'auto'">height: 100%;</xsl:when>
														<xsl:otherwise>height: <xsl:value-of select="@height"/>;</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<xsl:if test="@icon != ''">
													<xsl:element name="div">
														<xsl:attribute name="class">material-symbols-rounded-<xsl:value-of select="@icon-size" /></xsl:attribute>
														<xsl:value-of select="@icon"/>
													</xsl:element>
												</xsl:if>
												<xsl:if test="@text != ''">
													<xsl:choose>
														<xsl:when test="@icon != ''">
															<div style="margin-right: 0.75em;">
																<xsl:value-of select="@text"/>
															</div>
														</xsl:when>
														<xsl:otherwise>
															<div style="margin: 1em;">
																<xsl:value-of select="@text"/>
															</div>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
											</xsl:element>
										</xsl:when>

										<!-- Include -->

										<xsl:when test="name() = 'Include'">
											include-<xsl:value-of select="@name"/>
										</xsl:when>

										<!-- Radio Button -->

										<xsl:when test="name() = 'Radio-Button'">
											<xsl:element name="div">
												<xsl:attribute name="class">Radio-Button</xsl:attribute>
												<xsl:element name="input">
													<xsl:attribute name="type">radio</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="@group"/>
													</xsl:attribute>
													<xsl:attribute name="id">radio<xsl:number value="position()" format="1"/></xsl:attribute>
													<xsl:attribute name="value">
														<xsl:value-of select="@value"/>
													</xsl:attribute>
													<xsl:if test="@pressed != ''">
														<xsl:if test="@pressed = 'yes'">
															<xsl:attribute name="checked"/>
														</xsl:if>
													</xsl:if>
												</xsl:element>
												<xsl:element name="label">
													<xsl:attribute name="for">radio<xsl:number value="position()" format="1"/></xsl:attribute>
													<xsl:attribute name="class">Radio-Label</xsl:attribute>
													<xsl:element name="div">
														<xsl:attribute name="class">Radio-Hover-Indicator</xsl:attribute>
														<xsl:element name="div">
															<xsl:attribute name="class">Radio-Indicator-Outer</xsl:attribute>
															<xsl:element name="div">
																<xsl:attribute name="class">Radio-Indicator-Inner</xsl:attribute>
															</xsl:element>
														</xsl:element>
													</xsl:element>
													<xsl:element name="div">
														<xsl:value-of select="@text"/>
													</xsl:element>
												</xsl:element>
											</xsl:element>
										</xsl:when>

										<!-- Switch -->

										<xsl:when test="name() = 'Switch'">
											<xsl:element name="div">
												<xsl:attribute name="class">Switch</xsl:attribute>
												<xsl:element name="input">
													<xsl:attribute name="type">checkbox</xsl:attribute>
													<xsl:attribute name="name">
														<xsl:value-of select="@group"/>
													</xsl:attribute>
													<xsl:attribute name="id">switch<xsl:number value="position()" format="1"/></xsl:attribute>
													<xsl:attribute name="value">
														<xsl:value-of select="@value"/>
													</xsl:attribute>
													<xsl:if test="@pressed != ''">
														<xsl:if test="@pressed = 'yes'">
															<xsl:attribute name="checked"/>
														</xsl:if>
													</xsl:if>
												</xsl:element>
												<xsl:element name="label">
													<xsl:attribute name="for">switch<xsl:number value="position()" format="1"/></xsl:attribute>
													<xsl:attribute name="class">Switch-Label</xsl:attribute>
													<xsl:element name="div">
														<xsl:value-of select="@text"/>
													</xsl:element>
													<xsl:element name="div">
														<xsl:attribute name="class">Switch-Main</xsl:attribute>
														<xsl:element name="div">
															<xsl:attribute name="class">Switch-Inner</xsl:attribute>
														</xsl:element>
													</xsl:element>
												</xsl:element>
											</xsl:element>
										</xsl:when>
									</xsl:choose>
								</xsl:for-each>
							</xsl:element>
							<script src="../Main/script.js" />
							<script src="../Main/Event.js" />
						</body>
					</html>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>