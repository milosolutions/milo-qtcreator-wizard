function Component()
{
}

Component.prototype.createOperationsForArchive = function(archive)
{
    component.addOperation("Extract", archive, "@TargetDir@/@ProjectName@");
	component.addOperation("Delete", "@TargetDir@/@ProjectName@/milo/mscripts/.git");
	component.addOperation("Delete", "@TargetDir@/@ProjectName@/milo/mscripts/.gitignore");
	component.addOperation("Delete", "@TargetDir@/@ProjectName@/milo/mscripts/.gitlab-ci.yml");
}

Component.prototype.createOperations = function()
{
    // call default implementation
    component.createOperations();
    component.addOperation("LineReplace", "@TargetDir@/@ProjectName@/milo/mscripts/version/bumpVersion.sh", "TEMPLATE_PROJECT_NAME", "TEMPLATE_PROJECT_NAME=\"@ProjectName@\"");
	component.addOperation("LineReplace", "@TargetDir@/@ProjectName@/milo/mscripts/version/bumpVersion.bat", "set TEMPLATE_PROJECT_NAME", "set TEMPLATE_PROJECT_NAME=@ProjectName@");
}
