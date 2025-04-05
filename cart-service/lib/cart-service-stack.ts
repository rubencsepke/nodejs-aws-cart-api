import * as cdk from "aws-cdk-lib";
import { Construct } from "constructs";
import { Code, Runtime, Function } from "aws-cdk-lib/aws-lambda";
import * as apigateway from "aws-cdk-lib/aws-apigateway";
import * as path from "path";
import { NodejsFunction } from "aws-cdk-lib/aws-lambda-nodejs";

export class CartServiceStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const cartLambda = new NodejsFunction(this, "CartLambda", {
      runtime: Runtime.NODEJS_20_X,
      handler: "handler",
      entry: path.join(__dirname, '../../dist/lambda.js'),
      depsLockFilePath: path.join(__dirname, '../../package-lock.json'),
      environment: {
        POSTGRES_HOST: process.env.DB_HOST!,
        POSTGRES_PORT: process.env.DB_PORT!,
        POSTGRES_USERNAME: process.env.DB_USERNAME!,
        POSTGRES_PASSWORD: process.env.DB_PASSWORD!,
        POSTGRES_DATABASE: process.env.DB_DATABASE!,
      },
      bundling: {
        nodeModules: [
          '@nestjs/core',
          '@nestjs/common',
          '@nestjs/platform-express',
          'reflect-metadata',
        ],
      },
      timeout: cdk.Duration.seconds(3),
    });

    new apigateway.LambdaRestApi(this, "CartApiGateway", {
      restApiName: "CartAPIGateway",
      handler: cartLambda,
    });
  }
}
