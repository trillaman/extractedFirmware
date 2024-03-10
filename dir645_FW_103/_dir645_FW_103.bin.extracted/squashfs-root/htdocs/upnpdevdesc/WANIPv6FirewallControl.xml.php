<? echo "<\?xml version=\"1.0\"?\>"; ?>
<scpd xmlns="urn:schemas-upnp-org:service-1-0">
	<specVersion>
		<major>1</major>
		<minor>0</minor>
	</specVersion>	
	<actionList>
		<action>
			<name>GetFirewallStatus</name>
			<argumentList>
				<argument>
					<name>FirewallEnabled</name>
					<direction>out</direction>
					<relatedStateVariable>FirewallEnabled</relatedStateVariable>
				</argument>
				<argument>
					<name>InboundPinholeAllowed</name>
					<direction>out</direction>
					<relatedStateVariable>InboundPinholeAllowed</relatedStateVariable>
				</argument>
			</argumentList>
		</action>		
		<action>
			<name>GetOutboundPinholeTimeout</name>
			<argumentList>
				<argument>
					<name>RemoteHost</name>
					<direction>in</direction>
						<relatedStateVariable>RemoteHost</relatedStateVariable>
				</argument>
				<argument>
					<name>RemotePort</name>
					<direction>in</direction>
					<relatedStateVariable>RemotePort</relatedStateVariable>
				</argument>
				<argument>
					<name>InternalClient</name>
					<direction>in</direction>
					<relatedStateVariable>InternalClient</relatedStateVariable>
				</argument>
				<argument>
					<name>InternalPort</name>
					<direction>in</direction>
					<relatedStateVariable>InternalPort</relatedStateVariable>
				</argument>
				<argument>
					<name>Protocol</name>
					<direction>in</direction>
					<relatedStateVariable>Protocol</relatedStateVariable>
				</argument>
				<argument>
					<name>OutboundPinholeTimeout</name>
					<direction>out</direction>
					<relatedStateVariable>OutboundPinholeTimeout</relatedStateVariable>
				</argument>
			</argumentList>
		</action>	
		<action>
			<name>AddPinhole</name>
			<argumentList>
				<argument>
					<name>RemoteHost</name>
					<direction>in</direction>
					<relatedStateVariable>RemoteHost</relatedStateVariable>
				</argument>
				<argument>
					<name>RemotePort</name>
					<direction>in</direction>
					<relatedStateVariable>RemotePort</relatedStateVariable>
				</argument>
				<argument>
					<name>InternalClient</name>
					<direction>in</direction>
					<relatedStateVariable>InternalClient</relatedStateVariable>
				</argument>
				<argument>
					<name>InternalPort</name>
					<direction>in</direction>
					<relatedStateVariable>InternalPort</relatedStateVariable>
				</argument>
				<argument>
					<name>Protocol</name>
					<direction>in</direction>
					<relatedStateVariable>Protocol</relatedStateVariable>
				</argument>
				<argument>
					<name>LeaseTime</name>
					<direction>in</direction>
					<relatedStateVariable>LeaseTime</relatedStateVariable>
				</argument>
				<argument>
					<name>UniqueID</name>
					<direction>out</direction>
					<relatedStateVariable>UniqueID</relatedStateVariable>
				</argument>
			</argumentList>
		</action>		
		<action>
			<name>UpdatePinhole</name>
			<argumentList>
				<argument>
					<name>UniqueID</name>
					<direction>in</direction>
					<relatedStateVariable>UniqueID</relatedStateVariable>
				</argument>
				<argument>
					<name>NewLeaseTime</name>
					<direction>in</direction>
					<relatedStateVariable>LeaseTime</relatedStateVariable>
				</argument>
			</argumentList>
		</action>		
		<action>
			<name>DeletePinhole</name>
			<argumentList>
				<argument>
					<name>UniqueID</name>
					<direction>in</direction>
					<relatedStateVariable>UniqueID</relatedStateVariable>
				</argument>
			</argumentList>
		</action>		
		<action>
			<name>GetPinholePackets</name>
			<argumentList>
				<argument>
					<name>UniqueID</name>
					<direction>in</direction>
					<relatedStateVariable>UniqueID</relatedStateVariable>
				</argument>
				<argument>
					<name>PinholePackets</name>
					<direction>out</direction>
					<relatedStateVariable>PinholePackets</relatedStateVariable>
				</argument>
			</argumentList>
		</action>		
		<action>
			<name>CheckPinholeWorking</name>
			<argumentList>
				<argument>
					<name>UniqueID</name>
					<direction>in</direction>
					<relatedStateVariable>UniqueID</relatedStateVariable>
				</argument>
				<argument>
					<name>IsWorking</name>
					<direction>out</direction>
					<relatedStateVariable>IsWorking</relatedStateVariable>
				</argument>
			</argumentList>
		</action>		
	</actionList>				
	<serviceStateTable>	
		<stateVariable sendEvents="yes">
			<name>FirewallEnabled</name>
			<dataType>boolean</dataType>
		</stateVariable>		
		<stateVariable sendEvents="yes">
			<name>InboundPinholeAllowed</name>
			<dataType>boolean</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>OutboundPinholeTimeout</name>
			<dataType>ui4</dataType>
			<allowedValueRange>
				<minimum>Vendor-defined</minimum>
				<maximum>Vendor-defined</maximum>
			</allowedValueRange>
		</stateVariable>	
		<stateVariable sendEvents="no">
			<name>RemoteHost</name>
			<dataType>string</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>RemotePort</name>
			<dataType>ui2</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>InternalClient</name>
			<dataType>string</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>InternalPort</name>
			<dataType>ui2</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>Protocol</name>
			<dataType>ui2</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>LeaseTime</name>
			<dataType>ui4</dataType>
			<allowedValueRange>
				<minimum>1</minimum>
				<maximum>86400</maximum>
			</allowedValueRange>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>UniqueID</name>
			<dataType>ui2</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>PinholePackets</name>
			<dataType>ui4</dataType>
		</stateVariable>		
		<stateVariable sendEvents="no">
			<name>A_ARG_TYPE_Boolean</name>
			<dataType>boolean</dataType>
		</stateVariable>		
	</serviceStateTable>	
</scpd>
		
		
