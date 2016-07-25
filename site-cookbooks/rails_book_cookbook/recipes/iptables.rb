# Reject packets other than those explicitly allowed
simple_iptables_policy "INPUT" do
  policy "DROP"
end

simple_iptables_rule "system" do
  rule [ # Allow all traffic on the loopback device
         "--in-interface lo",
         # Allow any established connections to continue, even
         # if they would be in violation of other rules.
         "-m conntrack --ctstate ESTABLISHED,RELATED",
         # Allow SSH
         "--proto tcp --dport 22",
       ]
  jump "ACCEPT"
end

# Allow HTTP, HTTPS
simple_iptables_rule "http" do
  rule [ "--proto tcp --dport 80",
         "--proto tcp --dport 443" ]
  jump "ACCEPT"
end
