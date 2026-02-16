[200~version: 0.2

env:
  variables:
      ImageName: simpledockerapp
          AWS_DEFAULT_REGION: ap-south-1
	      AWS_ACCOUNT_ID: 233894721698

	      phases:
	        install:
		    runtime-versions:
		          docker: 20

			    pre_build:
			        commands:
				      echo Logging in to Amazon ECR
				            aws ecr get-login-password --region $AWS_DEFAULT_REGION \
					          | docker login --username AWS --password-stdin \
						        $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com

							  build:
							      commands:
							            echo Build started on `date`
								          docker build -t $ImageName .
									        docker tag $ImageName:latest \
										      $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ImageName:latest

										        post_build:
											    commands:
											          echo Pushing image to ECR
												        docker push \
													      $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$ImageName:latest
													            echo Build completed

