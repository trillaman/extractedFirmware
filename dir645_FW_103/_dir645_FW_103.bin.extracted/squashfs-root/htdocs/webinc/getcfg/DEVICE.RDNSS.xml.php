<module>
	<service><?=$GETCFG_SVC?></service>
	<device>
		<rdnss><?echo get("x","/device/rdnss");?></rdnss>
		<dhcp6hint><?echo get("x","/device/dhcp6hint");?></dhcp6hint>
	</device>
</module>
