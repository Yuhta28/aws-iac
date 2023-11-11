import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import * as awsx from "@pulumi/awsx";
import { readFileSync } from "fs";
export const readme = readFileSync("./README.md").toString();

// Pulumi Cloudで設定されているAWSリージョン情報を取得
const awsRegion = process.env.AWS_REGION

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
      serviceName: `com.amazonaws.${awsRegion}.s3`,
      tags: {
        Name: "pulumi-s3-endpoint",
      }
    },
  ],
});
