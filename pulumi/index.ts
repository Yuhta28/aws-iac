import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import * as awsx from "@pulumi/awsx";
import { readFileSync } from "fs";
import { type } from "os";
export const readme = readFileSync("./README.md").toString();

// create VPC resource in Pulumi TS
const vpc = new awsx.ec2.Vpc("vpc", {
  cidrBlock: "172.16.0.0/16",
  enableDnsHostnames: true,
  enableDnsSupport: true,
  subnetSpecs: [
    {
      type: awsx.ec2.SubnetType.Public,
      name: "public",
      cidrMask: 24,
    },
    {
      type: awsx.ec2.SubnetType.Private,
      name: "private",
      cidrMask: 24,
    },
  ],
  natGateways: {
    strategy: awsx.ec2.NatGatewayStrategy.None,
  },
  tags: {
    Name: "pulumi-vpc",
  },

  vpcEndpointSpecs: [
    {
      serviceName: `com.amazonaws.${AWS_REGION}.s3`,
    },
  ],
});
