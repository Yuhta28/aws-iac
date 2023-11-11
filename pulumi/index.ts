import * as pulumi from "@pulumi/pulumi";
import * as aws from "@pulumi/aws";
import * as awsx from "@pulumi/awsx";
import { readFileSync } from "fs";
export const readme = readFileSync("./README.md").toString();

// create VPC resource in Pulumi TS
const vpc = new awsx.ec2.Vpc("vpc", {
    cidrBlock: "10.0.0.0/16",
    enableDnsHostnames: true,
    enableDnsSupport: true,
    tags: {
        Name: "pulumi-vpc",
    }
});