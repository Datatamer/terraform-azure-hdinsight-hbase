//Public network security group
resource "azurerm_network_security_group" "hdinsight_hbase_nsg" {
  name = var.public_nsg_name
  location = var.location
  resource_group_name = var.resource_group
  tags = var.tags
}

//NOTE: remove the following if it is known in testing that only 1 nsg is required

////Private network security group
//resource "azurerm_network_security_group" "hdinsight_hbase_nsg" {
//  name = var.private_nsg_name
//  location = var.location
//  resource_group_name = var.resource_group
//  tags = var.tags
//}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet_connection" {
  network_security_group_id = azurerm_network_security_group.hdinsight_hbase_nsg.id
  subnet_id = var.subnet_id
}

//Public ports - ssh
resource "azurerm_network_security_rule" "public_rule_sshd_1" {
  name = "Public sshd rule 1"
  description = "sshd connection to primary headnode and edgenode"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 100
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefixs = []
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "public_rule_sshd_2" {
  name = "Public sshd rule 2"
  description = "sshd connection to the secondary headnode"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 101
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "23"
  source_address_prefixs = []
  destination_address_prefix = "VirtualNetwork"
}

//Public ports https
resource "azurerm_network_security_rule" "public_rule_https" {
  name = "Public https rule"
  description = "https connections for Ambari UI, Ambari REST API, HCatalog REST API, Hive ODBC, ApacheHive JDBC, Hbase REST API, Spark REST API, Spark Thrift Server, Storm web UI, Kafka REST API"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 103
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "443"
  source_address_prefixs = []
  destination_address_prefix = "VirtualNetwork"

}

//Private ports - Ambari
resource "azurerm_network_security_rule" "private_rule_8080" {
  name = "Private rule 8080"
  description = "http connections to Ambari web UI and Ambari REST API"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 100
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8080"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - HDFS ports
resource "azurerm_network_security_rule" "private_rule_30070" {
  name = "Private rule 30070"
  description = "NameNode web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 101
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30070"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8020" {
  name = "Private rule 8020"
  description = "NameNode metadata service"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 102
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8020"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_30075" {
  name = "Private rule 30075"
  description = "DataNode WebUI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 103
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30075"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_30010" {
  name = "Private rule 30010"
  description = "DataNode data transfer"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 104
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30010"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_30020" {
  name = "Private rule 30020"
  description = "DataNode Metadata operations"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 105
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30020"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_50090" {
  name = "Private rule 50090"
  description = "Secondary NameNode - checkpoint for metadata"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 106
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "50090"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_50090" {
  name = "Private rule 50090"
  description = "Secondary NameNode - checkpoint for metadata"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 106
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "50090"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - YARN ports
resource "azurerm_network_security_rule" "private_rule_8088" {
  name = "Private rule 8088"
  description = "Resource manager web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 107
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8088"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8090" {
  name = "Private rule 8090"
  description = "Resource manager web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 108
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8090"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8141" {
  name = "Private rule 8141"
  description = "Resource manager admin interface"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 109
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8141"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8030" {
  name = "Private rule 8030"
  description = "Resource manager scheduler"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 110
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8030"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8050" {
  name = "Private rule 8050"
  description = "Resource manager application interface"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 111
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8050"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_30050" {
  name = "Private rule 30050"
  description = "NodeManager"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 112
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30050"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_30060" {
  name = "Private rule 30060"
  description = "NodeManager web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 113
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30060"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_10200" {
  name = "Private rule 10200"
  description = "Timeline address"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 114
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "10200"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8188" {
  name = "Private rule 8188"
  description = "Timeline web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 115
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8188"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - Hive ports
resource "azurerm_network_security_rule" "private_rule_10001" {
  name = "Private rule 10001"
  description = "Hive Server 2"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 116
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "10001"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_9083" {
  name = "Private rule 9083"
  description = "Hive Metastore"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 117
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "9083"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - WebHCat ports
resource "azurerm_network_security_rule" "private_rule_30111" {
  name = "Private rule 30111"
  description = "WebHCat server"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 118
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30111"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - MapReduce ports
resource "azurerm_network_security_rule" "private_rule_19888" {
  name = "Private rule 19888"
  description = "Job History Web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 119
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "19888"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_10020" {
  name = "Private rule 10020"
  description = "Job History server"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 120
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "10020"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_13562" {
  name = "Private rule 13562"
  description = "Shuffle Handler"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 121
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "13562"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - Oozie
resource "azurerm_network_security_rule" "private_rule_11000" {
  name = "Private rule 11000"
  description = "Oozie service URL"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 122
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "11000"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_11001" {
  name = "Private rule 11001"
  description = "Oozie admin port"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 123
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "11001"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - Ambari Metrics
resource "azurerm_network_security_rule" "private_rule_6188" {
  name = "Private rule 6188"
  description = "TimeLine service web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 124
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "6188"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_30200" {
  name = "Private rule 30200"
  description = "TimeLine service web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 125
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "30200"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - Hbase ports
resource "azurerm_network_security_rule" "private_rule_16000" {
  name = "Private rule 16000"
  description = "HMaster"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 126
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "16000"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_16010" {
  name = "Private rule 16010"
  description = "HMaster info Web UI"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 127
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "16010"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_16020" {
  name = "Private rule 16020"
  description = "Region server"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 128
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "16020"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_2181" {
  name = "Private rule 2181"
  description = "Zookeeper connection"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 129
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "2181"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - Kafka ports
resource "azurerm_network_security_rule" "private_rule_9092" {
  name = "Private rule 9092"
  description = "Broker for client communication"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 130
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "9092"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_9400" {
  name = "Private rule 9400"
  description = "Kafka REST Proxy"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 131
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "9400"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

//Private ports - Spark ports
resource "azurerm_network_security_rule" "private_rule_10002" {
  name = "Private rule 10002"
  description = "Spark thrift servers"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 132
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "10002"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8998" {
  name = "Private rule 8998"
  description = "Livy server"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 133
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8998"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}

resource "azurerm_network_security_rule" "private_rule_8001" {
  name = "Private rule 8001"
  description = "Jupyter notebook"
  access = "Allow"
  direction = "Inbound"
  network_security_group_name = azurerm_network_security_group.hdinsight_hbase_nsg.name
  priority = 134
  protocol = "Tcp"
  resource_group_name = var.resource_group
  source_port_range = "*"
  destination_port_range = "8001"
  source_address_prefix = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"
}
